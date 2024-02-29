using Chat.Domain.Models;

namespace Chat.Hubs.Services;

public interface IChatService
{
    Task Login(User user);
    Task Logout(string connectionId);
}
