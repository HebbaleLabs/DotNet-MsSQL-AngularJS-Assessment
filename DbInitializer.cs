using System;
using System.Linq;
using System.Reflection;
using DbUp;
using DbUp.Helpers;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.Configuration;

namespace Assessment
{
	public static class DbInitializer
    {
        public static void Initialize(IConfiguration configuration)
        {
            var upgrader = DeployChanges
                .To
                .SqlDatabase(configuration.GetConnectionString("BloggingDatabase"))
                .JournalTo(new NullJournal())
                .WithScriptsEmbeddedInAssembly(
                    Assembly.GetExecutingAssembly())
                .WithTransactionPerScript()
                .LogToAutodetectedLog()
                .LogScriptOutput()
                .WithExecutionTimeout(new TimeSpan(0, 0, 90))
                .Build();

            var result = upgrader.PerformUpgrade();
        }
    }
}
