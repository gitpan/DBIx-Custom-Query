package DBIx::Custom::Query;
use Object::Simple;

our $VERSION = '0.0101';

sub sql             : Attr {}
sub key_infos       : Attr {}
sub bind_filter     : Attr {}
sub fetch_filter     : Attr {}
sub sth             : Attr {}

sub no_bind_filters      : Attr { type => 'array', trigger => sub {
    my $self = shift;
    my $no_bind_filters = $self->no_bind_filters || [];
    my %no_bind_filters_map = map {$_ => 1} @{$no_bind_filters};
    $self->_no_bind_filters_map(\%no_bind_filters_map);
}}
sub _no_bind_filters_map : Attr {default => sub { {} }}

sub no_fetch_filters     : Attr { type => 'array', default => sub { [] } }

Object::Simple->build_class;

=head1 NAME

DBIx::Custom::Query - Query object for DBIx::Custom

=head1 VERSION

Version 0.0101

=head1 SYNOPSIS

    # Create query
    my $dbi = DBIx::Custom->new;
    my $query = $dbi->create_query($template);
    
    # Set query attributes
    $query->bind_filter($dbi->filters->{default_bind_filter});
    $query->no_bind_filters('title', 'author');
    
    $query->fetch_filter($dbi->filters->{default_fetch_filter});
    $query->no_fetch_filters('title', 'author');
    
    # Execute query
    $dbi->execute($query, $params);

=head1 OBJECT ACCESSORS

=head2 sth

    # Set and get statement handle
    $self = $query->sth($sql);
    $sth  = $query->sth;

=head2 sql

    # Set and get SQL
    $self = $query->sql($sql);
    $sql  = $query->sql;

=head2 bind_filter

    # Set and get bind filter
    $self        = $query->bind_filter($bind_filter);
    $bind_filter = $query->bind_filter;

=head2 no_bind_filters

    # Set and get keys of no filtering
    $self            = $query->no_bind_filters($no_filters);
    $no_bind_filters = $query->no_bind_filters;

=head2 fetch_filter

    # Set and get fetch filter
    $self        = $query->fetch_filter($fetch_filter);
    $fetch_filter = $query->fetch_filter;

=head2 no_fetch_filters

    # Set and get keys of no filtering
    $self            = $query->no_fetch_filters($no_filters);
    $no_fetch_filters = $query->no_fetch_filters;

=head2 key_infos

    # Set and get key informations
    $self      = $query->key_infos($key_infos);
    $key_infos = $query->key_infos;

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

Github L<http://github.com/yuki-kimoto>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
