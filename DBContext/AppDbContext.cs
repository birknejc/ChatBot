using Microsoft.EntityFrameworkCore;

using BlazorServerCorr.Models;

public class AppDbContext : DbContext
{
    public DbSet<Fossil> Fossils { get; set; }

    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
}
