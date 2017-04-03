$genelist = $ARGV[0];
$geneexp = $ARGV[1];
$outputfile = $ARGV[2];

open GENELIST, $genelist;
open GENEXP, $geneexp;
open OUTFILE,">$outputfile";
my @array = ();
my @genelist_array = ();
my @genexp_array = ();
my $row = 0;
$count = `wc -l < $genelist`;

while ($line=<GENELIST>) {
    chomp $line;
    my @genelist_array = split('\t',$line);
    #print STDERR "GENE: $genelist_array[2] \n";
    for my $i(0..$#genelist_array){
	$array [$row][$i] = $genelist_array [$i];
    }
    $row ++;
}

while ($genexp=<GENEXP>) {
    chomp $genexp;
    my @genexp_array = split('\,',$genexp);

    #print OUTFILE "$genexp \n";
    for ($j = 1; $j < $count + 2; $j=$j+1) {
	 my $i = 1;
	print STDERR "GENE:  $array[$j][2]\ $genexp_array[0] \n";
	if ($genexp_array[0] eq $array[$j][2]) {
		print OUTFILE "$array[$j][2]\t$array[$j][3]\t$array[$j][0]\t$array[$j][1]\t";
	    #print STDERR "GENE:  $array[$j][2] \n";
	    while ($i <= 26) {
		if ($i eq 26){
		    print OUTFILE "$genexp_array[$i]\n";
		    last;
		}
		print OUTFILE "$genexp_array[$i]\t";
		$i++
	    }
	    
	    #print OUTFILE "$array[$j][2]\t$array[$j][3]\t$array[$j][0]\t$array[$j][1]\t$genexp[1]\t$genexp[2]\t$genexp[3]\t$genexp[4]\t$genexp[5]\t$genexp[6]\t$genexp[7]\t$genexp[8]\t$genexp[9]\t$genexp[9]\t$genexp[10]\t$genexp[11]\t$genexp[12]\t$genexp[13]\t$genexp[14]\t$genexp[16]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t$genexp[2]\t\n";
	}
	elsif($j < $count + 1){
	    next;
	}
    }
}

$to = 'haroonkhazi@gmail.com';
$from = 'hxk443@case.edu';
$subject = 'Analysis ';
$message = "$ARGV[2]";
 
open(MAIL, "|/usr/sbin/sendmail -t");
 
 #Email Header
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
 #Email Body
print MAIL $message;

close(MAIL);
print "Email Sent Successfully\n";


    
