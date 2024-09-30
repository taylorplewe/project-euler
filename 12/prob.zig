const std = @import("std");

pub fn main() void {
    var toAdd: u64 = 11;
    var num: u64 = 55;
    while (true) {
        num += toAdd;
        if (getNumFactors(num) >= 500) break;
        toAdd += 1;
    }
    std.debug.print("{d}\n", .{num});
}

fn getNumFactors(num: u64) u32 {
    var num_factors: u32 = 2;
    var divisor: u64 = 2;
    const sqrt = std.math.sqrt(num);
    while (divisor <= sqrt) : (divisor += 1) {
        if (num % divisor == 0) {
            num_factors += if (divisor == sqrt) 1 else 2;
        }
    }
    return num_factors;
}
