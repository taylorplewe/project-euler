const std = @import("std");

pub fn main() void {
    comptime var prod_sum: u64 = 0;
    comptime var sum_prod: u64 = 0;

    inline for (1..101) |i| {
        prod_sum += i;
        sum_prod += (i * i);
    }
    prod_sum *= prod_sum;

    const res = prod_sum - sum_prod;
    std.debug.print("{d}\n", .{res});
}
