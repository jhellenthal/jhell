#!/bin/sh -
#
# Copyright (c) 1984, 1986, 1990, 1993
#	The Regents of the University of California.  All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 4. Neither the name of the University nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
#	@(#)newvers.sh	8.1 (Berkeley) 4/20/94
# $FreeBSD: stable/8/sys/conf/newvers.sh 215684 2010-11-22 16:09:57Z kensmith $

TYPE="FreeBSD"
REVISION="8.2"
BRANCH="STABLE"
if [ "X${BRANCH_OVERRIDE}" != "X" ]; then
	BRANCH=${BRANCH_OVERRIDE}
fi
RELEASE="${REVISION}-${BRANCH}"
VERSION="${TYPE} ${RELEASE}"

# These are here so we don't have to work in reverse later on.
SRCDIR=$(dirname $0)/../..
SYSDIR=${SRCDIR}/sys

if [ "X${PARAMFILE}" != "X" ]; then
	RELDATE=$(awk '/__FreeBSD_version.*propagated to newvers/ {print $3}' \
		${PARAMFILE})
else
	RELDATE=$(awk '/__FreeBSD_version.*propagated to newvers/ {print $3}' \
		${SYSDIR}/sys/param.h)
fi

b=share/examples/etc/bsd-style-copyright
year=`date '+%Y'`
# look for copyright template
for bsd_copyright in ../$b ../../$b ../../../$b /usr/src/$b /usr/$b
do
	if [ -r "$bsd_copyright" ]; then
		COPYRIGHT=`sed \
		    -e "s/\[year\]/1992-$year/" \
		    -e 's/\[your name here\]\.* /The FreeBSD Project./' \
		    -e 's/\[your name\]\.*/The FreeBSD Project./' \
		    -e '/\[id for your version control system, if any\]/d' \
		    $bsd_copyright` 
		break
	fi
done

# no copyright found, use a dummy
if [ X"$COPYRIGHT" = X ]; then
	COPYRIGHT="/*-
 * Copyright (c) 1992-$year The FreeBSD Project.
 * All rights reserved.
 *
 */"
fi

# add newline
COPYRIGHT="$COPYRIGHT
"

LC_ALL=C; export LC_ALL
if [ ! -r version ]; then
	echo 0 >version
fi

v=`cat version` u=${USER:-root} d=`pwd` h=${HOSTNAME:-`hostname`} t=`date`
i=`${MAKE:-make} -V KERN_IDENT`

if [ -d "${SRCDIR}/.svn" -o -d "${SYSDIR}/.svn" ]; then
	for dir in /usr/bin ${LOCALBASE:-/usr/local}/bin; do
		if [ -x "${dir}/svn" ]; then
			svnversion=${dir}/svnversion
			break
		fi
	done
	if [ -n "$svnversion" ] ; then
		svnrev=" r`cd ${SYSDIR} && $svnversion`"
	fi
fi

if [ -d "${SRCDIR}/.hg" -o -d "${SYSDIR}/.hg" ]; then
	for dir in /usr/bin ${LOCALBASE:-/usr/local}/bin; do
		if [ -x "${dir}/hg" ]; then
			hg=${dir}/hg
			break
		fi
	done
	if [ -n "$hg" ]; then
		hgrev=" `cd ${SYSDIR} && $hg tip --template '{rev}:{node|short}'`"
	fi
fi

if [ -d "${SRCDIR}/.git" -o -d "${SYSDIR}/.git" ]; then
	for dir in /usr/bin ${LOCALBASE:-/usr/local}; do
		if [ -x "${dir}/git" ]; then
			if [ -d "${SRCDIR}/.git" ]; then
				git="${dir}/git --git-dir=${SRCDIR}/.git"
				git="${git} --work-tree=${SRCDIR}"
			else
				git="${dir}/git --git-dir=${SYSDIR}/.git"
				git="${git} --work-tree=${SYSDIR}"
			fi
			break
		fi
	done

	if [ -n "$git" ] ; then
		gitrev="`$git rev-parse --verify --short HEAD 2>/dev/null`"
		gitsvnrev="`$git svn find-rev $gitrev 2>/dev/null`"
		if [ -n "${gitsvnrev}" ] ; then
			svnrev=" r${gitsvnrev}"
			gitrev=" ${gitrev}"
		else
			gitsvnid="`$git log |sed -n '/git-svn-id:/ {
			s/.*@\([[:digit:]]\{1,\}\).*/\1/p; q; }'`"
			if [ -n "${gitsvnid}" ]; then
				svnrev=" r${gitsvnid}"
				gitrev="+${gitrev}"
			else
				gitrev=" ${gitrev}"
			fi
		fi
		if [ -n "`$git diff-index --name-only HEAD`" ]; then
			gitrev="${gitrev}-dirty"
		fi
	fi
fi

cat << EOF > vers.c
$COPYRIGHT
#define SCCSSTR "@(#)${VERSION} #${v}${svnrev}${gitrev}${hgrev} ${t}"
#define VERSTR "${VERSION} #${v}${svnrev}${gitrev}${hgrev} ${t}\\n 	${u}@${h}:${d}\\n"
#define RELSTR "${RELEASE}"

char sccs[sizeof(SCCSSTR) > 128 ? sizeof(SCCSSTR) : 128] = SCCSSTR;
char version[sizeof(VERSTR) > 256 ? sizeof(VERSTR) : 256] = VERSTR;
char ostype[] = "${TYPE}";
char osrelease[sizeof(RELSTR) > 32 ? sizeof(RELSTR) : 32] = RELSTR;
int osreldate = ${RELDATE};
char kern_ident[] = "${i}";
EOF

echo $((${v}+1)) >version
