using Chat.Domain.Models;

namespace Chat.Hubs.Services;

internal class ChatService : IChatService
{
    private static readonly List<User> _users = [];
    private static object _lock = new();

    public Task Login(User user)
    {
        lock (_lock)
        {
            if (_users.Any(c => c.Id == user.Id))
            {
                _users.RemoveAll(c => c.Id == user.Id);
            }
            _users.Add(user);
        }
        return Task.CompletedTask;
    }

    public Task Logout(string connectionId)
    {
        lock (_lock)
        {
            _users.RemoveAll(user => user.ConnectionId == connectionId);
        }
        return Task.CompletedTask;
    }
}
