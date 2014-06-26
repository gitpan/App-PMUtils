
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.019.
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Command line to manipulate Perl module files",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-PMUtils",
  "EXE_FILES" => [
    "bin/pmless",
    "bin/pmdoc",
    "bin/pmcost",
    "bin/pmless-colon",
    "bin/pminfo",
    "bin/pmman",
    "bin/podpath",
    "bin/pmedit",
    "bin/pmpath"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::PMUtils",
  "PREREQ_PM" => {
    "Complete::Module" => "0.03",
    "Complete::Util" => 0,
    "Log::Any" => 0,
    "Perinci::CmdLine" => "1.04",
    "SHARYANTO::Module::Path" => 0,
    "String::ShellQuote" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.07",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Complete::Module" => "0.03",
  "Complete::Util" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Log::Any" => 0,
  "Perinci::CmdLine" => "1.04",
  "SHARYANTO::Module::Path" => 0,
  "String::ShellQuote" => 0,
  "Test::More" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


