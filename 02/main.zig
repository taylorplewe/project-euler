const std = @import("std");

pub fn main() void {
    var i: u32 = 1;
    var j: u32 = 1;
    var total: u64 = 0;

    while (true) {
        const oldj = j;
        j += i;
        if (j < 100) {
            std.debug.print("{}\n", .{j});
        }
        if (j > 4000000) {
            break;
        }
        if (j & 1 == 0) {
            total += j;
        }
        i = oldj;
    }
    std.debug.print("{}\n", .{total});
}
