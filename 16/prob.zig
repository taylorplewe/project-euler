const std = @import("std");

pub fn main() !void {
    // get contents of result.txt into a string
    const file = try std.fs.cwd().openFile("result.txt", .{});
    const size = try file.getEndPos();
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const buf = try allocator.alloc(u8, size);
    _ = try file.readAll(buf);

    // strip commas (tgis isn't really necessary just a bonus
    var sum: u32 = 0;
    var it = std.mem.splitScalar(u8, buf, ',');
    while (it.peek() != null) {
        for (it.next().?) |char| {
            sum += std.fmt.charToDigit(char, 10) catch 0;
        }
    }

    std.debug.print("sum: {d}\n", .{sum});
}
