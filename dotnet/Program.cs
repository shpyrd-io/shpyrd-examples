// ASP.NET Core minimal API: the .NET buildpack publishes and runs it; the
// platform's PORT becomes ASPNETCORE_URLS.
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", (HttpContext ctx) =>
{
    var who = ctx.Request.Headers["X-Shpyrd-User"].FirstOrDefault() ?? "anonymous visitor";
    var html = $"""
        <!doctype html><html lang="en"><head><meta charset="utf-8"><title>example-dotnet</title>
        <style>body{{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}}code{{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}}</style></head>
        <body><h1>.NET {Environment.Version} on shpyrd</h1><p>Hello, <code>{System.Net.WebUtility.HtmlEncode(who)}</code>.</p>
        <p>Project <code>{Environment.GetEnvironmentVariable("SHPYRD_PROJECT")}</code>, workspace <code>{Environment.GetEnvironmentVariable("SHPYRD_WORKSPACE")}</code>.</p></body></html>
        """;
    return Results.Content(html, "text/html; charset=utf-8");
});
app.MapGet("/healthz", () => "ok");

app.Run();
