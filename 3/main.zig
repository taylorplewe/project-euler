const std = @import("std");
const expect = std.testing.expect;

fn isPrime(num: u64) bool {
    if (num & 1 == 0) return false;
    var i: u64 = 3;
    while (i <= std.math.sqrt(num)) : (i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

pub fn main() void {
    const num: u64 = 600_851_475_143;

    // find highest prime factor of num
    var i: u64 = 3;
    var highest = i;
    while (i <= std.math.sqrt(num)) : (i += 2) {
        if (!isPrime(i)) continue;
        if (num % i == 0) highest = i;
    }

    std.debug.print("{}\n", .{highest});
}

test "isPrime works" {
    try expect(isPrime(3) == true);
    try expect(isPrime(10) == false);
    try expect(isPrime(97) == true);
    try expect(isPrime(93) == false);
}
