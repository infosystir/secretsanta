#!/usr/bin/perl -w

use strict;

while (<>)
{
  if( /([^;]+);([^;]+);<([^>]+)>;\"([^"]+)\"/ )
  {
    my $name = $1;
    my $handle = $2;
    my $email = $3;
    my $address = $4;

    print "---\n";
    print "name: $name\n";
    print "handle: $handle\n";
    print "email: $email\n";
    print "address: $address\n";
  }
}
