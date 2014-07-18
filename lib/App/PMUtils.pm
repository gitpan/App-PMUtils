package App::PMUtils;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.17'; # VERSION
our $DATE = '2014-07-18'; # DATE

our $_complete_module = sub {
    require Complete::Module;
    my %args = @_;

    my $word = $args{word} // '';

    # compromise, if word doesn't contain :: we use the safer separator /, but
    # if already contains '::' we use '::' (but this means in bash user needs to
    # use quote (' or ") to make completion behave as expected since : is a word
    # break character in bash/readline.
    my $sep = $word =~ /::/ ? '::' : '/';
    $word =~ s/\W+/::/g;

    {
        completion => Complete::Module::complete_module(
            word      => $word,
            find_pmc  => 0,
            find_pod  => 0,
            separator => $sep,
            ci        => 1, # convenience
        ),
        is_path    => 1,
        path_sep   => $sep,
    };
};

our $_complete_pod = sub {
    require Complete::Module;
    my %args = @_;

    my $word = $args{word} // '';

    my $sep = $word =~ /::/ ? '::' : '/';
    $word =~ s/\W+/::/g;

    {
        completion => Complete::Module::complete_module(
            word      => $word,
            find_pm   => 0,
            find_pmc  => 0,
            find_pod  => 1,
            separator => '/',
            ci        => 1, # convenience
        ),
        is_path    => 1,
        path_sep   => $sep,
    };
};

1;
# ABSTRACT: Command line to manipulate Perl module files

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PMUtils - Command line to manipulate Perl module files

=head1 VERSION

This document describes version 0.17 of App::PMUtils (from Perl distribution App-PMUtils), released on 2014-07-18.

=head1 SYNOPSIS

This distribution provides the following command-line utilities:

 pminfo
 pmversion
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

True. The main point of these utilities is shell tab completion, to save
typing.

=head2 In shell completion, why do you use / (slash) instead of :: (double colon) as it should be?

If you type module name which doesn't contain any ::, / will be used as
namespace separator. Otherwise if you already type ::, it will use ::.

Colon is problematic because by default it is a word breaking character in bash.
This means, in this command:

 % pmpath Text:<tab>

bash is completing a new word (empty string), and in this:

 % pmpath Text::ANSITabl<tab>

bash is completing C<ANSITabl> instead of what we want C<Text::ANSITabl>.

The solution is to use quotes, e.g.

 % pmpath "Text:<tab>
 % pmpath 'Text:<tab>

or, use /.

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
