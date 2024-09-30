const std = @import("std");

pub fn main() void {
    var sum: u64 = 17;
    var n: u64 = 11;
    while (n < 2_000_000) : (n += 2) {
        sum += if (isPrime(n)) n else 0;
    }

    std.debug.print("sum: {d}\n", .{sum});
}

fn isPrime(num: u64) bool {
    //if (num & 1 == 0) return false;
    const sqrt = std.math.sqrt(num);
    var i: u64 = 3;
    while (i < sqrt+1) : (i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}
