const std = @import("std");

pub fn main() void {
    var quotient: u64 = 2520;
    while (!isAllDivisible(quotient)) : (quotient += 20) {}

    std.debug.print("num is {d}\n", .{quotient});
}

fn isAllDivisible(quotient: u64) bool {
    for (11..20) |divisor| {
        if (quotient % divisor != 0) return false;
    }
    return true;
}
