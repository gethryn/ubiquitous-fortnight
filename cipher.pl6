my $message = "This is a coded message!";
my $coded = "Xlmw mw e gshih qiwweki!"; # @ cipher index of 4

sub cipher($text, $offset) { 
    my @letters = "A".."Z";
    $text.trans( @letters.join ~ @letters.join.lc => 
                 @letters.rotate($offset).join ~ @letters.rotate($offset).join.lc ) }

sub decipher($coded, $offset) {
    return cipher($coded, $offset * -1);
}

say cipher("This is a coded message!", 4);
say cipher("This is a coded message!", 4) eq "Xlmw mw e gshih qiwweki!";

say cipher("Xlmw mw e gshih qiwweki!", -4);
say cipher("Xlmw mw e gshih qiwweki!", -4) eq "This is a coded message!";

say decipher("Xlmw mw e gshih qiwweki!", 4);
say decipher("Xlmw mw e gshih qiwweki!", 4) eq "This is a coded message!";


sub pigLatin($text) {
    my @words = $text.comb(/\w+/);
    for @words {
        $_ = $_.split('',:skip-empty).rotate(2).join;
        $_ ~= 'ay' if $_.chars > 2;
    }
    return @words.join(" ").tclc;
}

say pigLatin($message);
say pigLatin($message) eq "Isthay is a dedcoay ssagemeay";

my $piglatin = "Isthay is a dedcoay ssagemeay";

sub depigLatin($coded) {
    my @words = $coded.comb(/\w+/);
    for @words {
        $_ ~~ s/ay$// if $_.chars > 4;
        $_ = $_.split('',:skip-empty).rotate(-2).join;
    }
    return @words.join(" ").tclc;
}

say depigLatin($piglatin);
say depigLatin($piglatin) eq "This is a coded message";