using Chat.Domain.Models;

namespace Chat.Domain.Requests;

public record LoginRequest(Guid Id, string Name, string Email)
{
    public User ToUser(string connectionId)
    {
        return new User(Id, Name, Email, connectionId);
    }
}
