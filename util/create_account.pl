#!/usr/bin/perl -w
use strict;
use warnings;

my %STUDENTS = qw();

foreach my $idnum ( keys %STUDENTS ) {
	print "$idnum($STUDENTS{$idnum})...\n";

	#
	# 계정 및 홈디렉토리 생성
	# ( 기본 패스워드는 수업명이다. )
	#
	`useradd -m -g 1001 -s /bin/bash -k /etc/skel -p '\$6\$dDAYyS0l\$VjwvhOSvrd6.Xi5oi8FPzYDu/7wklcM/ptqDC22QsY2sY0WOtXGEgtt7mcEEsf5t2YSpsx/nTS1amQdwqEv74/' -c $STUDENTS{$idnum} $idnum`;

	#
	# 홈디렉토리 접근권한 변경
	#
	`chmod 700 /home/$idnum`;
}
