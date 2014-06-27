package App::PMUtils;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.09'; # VERSION
our $DATE = '2014-06-27'; # DATE

our $_complete_module = sub {
    require Complete::Module;
    require Complete::Util;
    my %args = @_;

    my $word = $args{word} // '';

    # convenience, convert all non-alphanums to ::, so you can type e.g. foo.bar
    # or foo-bar and they will be converted to foo::bar
    $word =~ s/\W+/::/g;

    Complete::Util::mimic_shell_dir_completion(
        completion => Complete::Module::complete_module(
            word      => $word,
            find_pmc  => 0,
            find_pod  => 0,
            separator => '/',
            ci        => 1, # convenience
        )
    );
};

our $_complete_pod = sub {
    require Complete::Module;
    require Complete::Util;
    my %args = @_;

    my $word = $args{word} // '';

    # convenience, convert all non-alphanums to ::, so you can type e.g. foo.bar
    # or foo-bar and they will be converted to foo::bar
    $word =~ s/\W+/::/g;

    Complete::Util::mimic_shell_dir_completion(
        completion => Complete::Module::complete_module(
            word      => $word,
            find_pm   => 0,
            find_pmc  => 0,
            find_pod  => 1,
            separator => '/',
            ci        => 1, # convenience
        )
    );
};

1;
# ABSTRACT: Command line to manipulate Perl module files

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PMUtils - Command line to manipulate Perl module files

=head1 VERSION

This document describes version 0.09 of App::PMUtils (from Perl distribution App-PMUtils), released on 2014-06-27.

=head1 SYNOPSIS

This distribution provides the following command-line utilities:

 pminfo
 pmpath
 podpath
 pmless
 pmedit
 pmcost
 pmdoc
 pmman

=head1 FAQ

=head2 What is the purpose of this distribution? Haven't other utilities existed?

For example, L<mpath> in L<Module::Path> distribution, L<mversion> in
L<Module::Version> distribution, etc.

True. The main point of these utilities are shell tab completion, to save
typing.

=head2 In shell completion, why do you use / (slash) instead of :: (double colon) as it should be?

Colon is problematic because by default it is a word breaking character in bash.
Here's my default COMP_WORDBREAKS:

 "'@><=;|&(:

This means, in this command:

 % pmpath Text:<tab>

bash is completing a new word (empty string), and in this:

 % pmpath Text::ANSITabl<tab>

bash is completing C<ANSITabl> instead of what we want C<Text::ANSITabl>.

So the workaround, instead of telling users to modify their COMP_WORDBREAKS
setting, is to use another character for the module separator (C</>).

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/App-PMUtils>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-App-PMUtils>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=App-PMUtils>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
