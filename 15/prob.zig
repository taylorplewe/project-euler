const std = @import("std");

const GRID_SIZE = 10;
pub fn main() void {
    const numPaths = getNumPathsFromPoint(0, 0);
    std.debug.print("{d}\n", .{numPaths});
}

fn getNumPathsFromPoint(x: u8, y: u8) u64 {
    var numPaths: u64 = 0;
    if (x < GRID_SIZE) numPaths += getNumPathsFromPoint(x + 1, y);
    if (y < GRID_SIZE) numPaths += getNumPathsFromPoint(x, y + 1);
    if (x == GRID_SIZE and y == GRID_SIZE) numPaths += 1;
    return numPaths;
}
