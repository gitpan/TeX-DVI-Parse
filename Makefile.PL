
use ExtUtils::MakeMaker;
WriteMakefile(
	NAME =>		'TeX::DVI::Parse',
	VERSION_FROM	=> 'Parse.pm',
	dist		=> { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	);
