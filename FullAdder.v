CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    HalfAdder(a=a, b=b, sum=absum, carry=abcarry);
    HalfAdder(a=c, b=absum, sum=sum, carry=abccarry);
    Or(a=abcarry,b=abccarry, out=carry);
}