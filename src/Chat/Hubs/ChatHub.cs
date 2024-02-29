using Chat.Domain.Requests;
using Chat.Hubs.Services;

using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;

namespace Chat.Hubs;

public class ChatHub : Hub
{
    private readonly ILogger<ChatHub> _logger;
    private readonly IChatService _chatService;

    public ChatHub(ILogger<ChatHub> logger, IChatService chatService)
    {
        _logger = logger;
        _chatService = chatService;
    }

    public override Task OnConnectedAsync()
    {
        _logger.LogDebug("Conexão recebida {ConnectionId}", Context.ConnectionId);
        return base.OnConnectedAsync();
    }

    public override async Task OnDisconnectedAsync(Exception exception)
    {
        _logger.LogWarning(exception, "Conexão encerrada com a conexão {ConnectionId}", Context.ConnectionId);
        await _chatService.Logout(Context.ConnectionId);
    }

    public async Task RequestLogin(LoginRequest loginRequest)
    {
        _logger.LogDebug("Autenticação requisitada para o usuário: {Name}", loginRequest.Name);
        await _chatService.Login(loginRequest.ToUser(Context.ConnectionId));
    }
}
