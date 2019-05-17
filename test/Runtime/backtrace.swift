// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -o %t/a.out
// RUN: not --crash %target-run %t/a.out 2>&1 | %{python} %utils/backtrace-check

// This is not supported on watchos, ios, or tvos
// UNSUPPORTED: OS=watchos
// UNSUPPORTED: OS=ios
// UNSUPPORTED: OS=tvos

// REQUIRES: swift_stdlib_asserts
// REQUIRES: executable_test

// Backtraces are not emitted when optimizations are enabled. This test can not
// run when optimizations are enabled.
// REQUIRES: swift_test_mode_optimize_none

// This file just causes a crash in the runtime to check whether or not a stack
// trace is produced from the runtime.

func main() {
  let x = UnsafePointer<Int>(bitPattern: 0)!
  print("\(x.pointee)")
}

main()
