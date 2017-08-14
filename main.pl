use strict;
use warnings;
use country;
use city;
my $sp = "\n";

my @s1 = ("New York", "Virginia", "California", "Florida", "Hawaii");
my $c1 = city->new( 'Name' => 'Los Angeles', 'Population' => '4 million');
my $country1 = country->new( 'Name' => "USA", 'Population' => "350 million", 'States' => \@s1, 'Best City' => $c1 );

my @s2 = ("Durango", "Puebla", "Guerrero", "Quintana Roo");
my $c2 = city->new( 'Name' => 'Cancun', 'Population' => '700,000');
my $country2 = country->new( 'Name' => "Mexico", 'Population' => "127 million", 'States' => \@s2, 'Best City' => $c2 );

my @countries = ($country1, $country2);

my $filename = 'log.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

foreach my $country (@countries) {
	print $fh "Name: ", $country->{'Name'}, $sp;
	print $fh "Population: ", $country->{'Population'}, $sp;
	print $fh "Best States: ", join(', ', @{$country->{'States'}}), $sp;
	print $fh "Top State Count: ", scalar @{$country->{'States'}}, $sp;
	print $fh "Best City: ", $country->{'Best City'}->{'Name'}, $sp;
	print $fh $country->{'Best City'}->{'Name'}, " Population: ", $country->{'Best City'}->{'Population'}, $sp, $sp;
}

close $fh;