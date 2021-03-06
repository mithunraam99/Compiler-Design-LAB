%{
%}

%s A B C DEAD

%%

<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>[^ba\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<B>a BEGIN C;
<B>b BEGIN INITIAL;
<B>[^ba\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Accepted\n");}

<C>a BEGIN B;
<C>b BEGIN A;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Not Accepted\n");}


<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}

%%

void main()
{
        printf("Enter the string:\n");

        yylex();
}
