#-------------------------------------------
#
#  votefair_ranking_do_calcs.pl
#
#-------------------------------------------


use VoteFairRanking ;

my $global_voteinfo_code_for_end_of_all_cases = -2 ;
my $global_input_line = '' ;
my $global_voteinfo_number = 0 ;
my $global_results_text = '' ;
my $global_input_line_counter = 0 ;
my $global_output_line_counter = 0 ;

&VoteFairRanking::votefair_start_new_cases( ) ;

while( $global_input_line = <STDIN> ) {
    chomp( $global_input_line ) ;
    &VoteFairRanking::votefair_put_next_vote_info_number( $global_input_line + 0 ) ;
    $global_input_line_counter ++ ;
}

&VoteFairRanking::votefair_do_calculations_all_questions( ) ;

$global_voteinfo_number = &VoteFairRanking::votefair_get_next_result_info_number( ) ;
while ( $global_voteinfo_number != $global_voteinfo_code_for_end_of_all_cases ) {
    $global_results_text .= sprintf( "%d" , $global_voteinfo_number ) . "\n" ;
    $global_voteinfo_number = &VoteFairRanking::votefair_get_next_result_info_number( ) ;
    $global_output_line_counter ++ ;
    if ( $global_output_line_counter > $global_input_line_counter + 1000 ) {
    	$global_results_text = 'Endless loop encountered!' . "\n" ;
    	exit ;
    }
}
$global_results_text .= sprintf( "%d" , $global_voteinfo_number ) . "\n" ;

print $global_results_text ;
