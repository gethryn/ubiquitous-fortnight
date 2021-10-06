grammar G {
    token TOP { <thingy> .* }
    token thingy { 'Þor' }
}
 
my $match = G.parse("Þor is mighty");
say $match.raku;