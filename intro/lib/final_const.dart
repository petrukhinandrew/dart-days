const int exampleIntConst = 5; // same as `const exampleIntConst = 5;`
// compile-time const, immutable
final int exampleIntFinal = 5;
// non-compile-time, immutable

int getValue() {
  return 10;
}

// const assignmentExample = get_value(); - error
final assignmentExample = getValue(); // ok 
// type inference works well, btw
 
// funciton calls does not work somwhere out of functions, C/C++ like 
// print(assignmentExample); fails 

