using Chat.Hubs.Services;

using Microsoft.Extensions.DependencyInjection;

namespace Chat.Hubs;

public static class DIExtensions
{
    public static IServiceCollection AddChatHub(this IServiceCollection services)
    {
        services.AddSingleton<IChatService, ChatService>();

        return services;
    }
}
