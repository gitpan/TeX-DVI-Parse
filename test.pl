#!/usr/bin/perl -w

use strict;

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $::loaded_dvi_parse;}

use TeX::DVI::Parse;
$::loaded_dvi_parse = 1;
print "ok 1\n";

my $dvi_parse = new TeX::DVI::Print("test.dvi");
print "not " unless defined $dvi_parse;
print "ok 2\n";

open OUT, "> test.new" or do { print "not ok 3\n"; exit(); };
select OUT;
$dvi_parse->parse();
close OUT;
select STDOUT;

open ORIG, "test.out" or do { print "not ok 3\n"; exit(); };
open NEW, "test.new" or do { print "not ok 3\n"; exit(); };
my $diff = 0;
while (<ORIG>)
	{ $diff++ if ($_ ne <NEW>); }
close ORIG;
close NEW;

print "not " if $diff;
print "ok 3\n";
