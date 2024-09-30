const std = @import("std");

pub fn main() !void {
    // get contents of file into a string
    const file = try std.fs.cwd().openFile("grid.txt", .{});
    defer file.close();
    var buf: [2048]u8 = undefined;
    _ = try file.readAll(&buf);

    var highestProd: u32 = 0;
    // loop over grid 4 times for each dir
    // -
    for (0..20) |row| {
        for (0..17) |col| {
            const prod = (
                (getNumAtInd(&buf, row, col)) *
                (getNumAtInd(&buf, row, col+1)) *
                (getNumAtInd(&buf, row, col+2)) *
                (getNumAtInd(&buf, row, col+3))
            );
            if (prod > highestProd) highestProd = prod;
        }
    }
    // \
    for (0..17) |row| {
        for (0..17) |col| {
            const prod = (
                (getNumAtInd(&buf, row, col)) *
                (getNumAtInd(&buf, row+1, col+1)) *
                (getNumAtInd(&buf, row+2, col+2)) *
                (getNumAtInd(&buf, row+3, col+3))
            );
            if (prod > highestProd) highestProd = prod;
        }
    }
    // |
    for (0..17) |row| {
        for (0..20) |col| {
            const prod = (
                (getNumAtInd(&buf, row, col)) *
                (getNumAtInd(&buf, row+1, col)) *
                (getNumAtInd(&buf, row+2, col)) *
                (getNumAtInd(&buf, row+3, col))
            );
            if (prod > highestProd) highestProd = prod;
        }
    }
    // /
    for (0..17) |row| {
        for (3..20) |col| {
            const prod = (
                (getNumAtInd(&buf, row, col)) *
                (getNumAtInd(&buf, row+1, col-1)) *
                (getNumAtInd(&buf, row+2, col-2)) *
                (getNumAtInd(&buf, row+3, col-3))
            );
            if (prod > highestProd) highestProd = prod;
        }
    }

    std.debug.print("highest prod: {d}\n", .{highestProd});
}

fn getNumAtInd(buf: *[2048]u8, row: usize, col: usize) u32 {
    const start = row * 60 + col * 3;
    const num: u32 = ((buf[start] - '0') * 10) + (buf[start + 1] - '0');
    return num;
}
