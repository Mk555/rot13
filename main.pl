#/usr/bin/perl

#use strict;
use warnings;
use Getopt::Std;

getopts("p:");

if ( not defined( $opt_p ) ){
        print( "Please give the phrase.\n" );
        exit 0;
}


my $vs_lToConvert = $opt_p;

my $vi_lNum;
my @vt_pToConvert;

@vt_pToConvert = split( //, $vs_lToConvert );


sub calculRot13 {

	my $vi_value = $_[0] + 13;

	if( $vi_value > 26 ){
		$vi_value = $vi_value - 26;
	}

	return $vi_value;

}


sub rot13Phrase {

	my $vs_letter;
	my @vt_pToConvert = split( //, $_[0] );
	my $vs_result;
	my @vt_pConverted;

	foreach ( @vt_pToConvert ) {

        	$vs_letter = $_;

        	# A is the 65th letter in the ASCII table.
        	# We only whant to convert letters, so we
        	# substract of  64 to have the order in
        	# the alphabet.
        	$vi_lNum = ord( $vs_letter );

                #print( $vs_letter . " => " . $vi_lNum . "\n" );
                #print( $vi_lNum . " <= " . chr( $vi_lNum + 64 ) . "\n" );
                if( $vi_lNum >= 65 && $vi_lNum <= 90 ){
			$vi_lNum = $vi_lNum - 64;
			$vi_lNum = calculRot13( $vi_lNum );
			$vi_lNum = $vi_lNum + 64;
		}
		elsif( $vi_lNum >= 97 && $vi_lNum <= 122 ){
			$vi_lNum = $vi_lNum - 96;
                        $vi_lNum = calculRot13( $vi_lNum );
                        $vi_lNum = $vi_lNum + 96;
		}
		
		push( @vt_pConverted, chr( $vi_lNum ));
		#push( @vt_pConverted, $vi_lNum . " " );

	}
	
	return( @vt_pConverted );

}

my @tableTemp = rot13Phrase( $vs_lToConvert );


print( @tableTemp );
#print( "\n" . $vs_lToConvert . "\n" );


print( "\n" );
