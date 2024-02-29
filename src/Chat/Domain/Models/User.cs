namespace Chat.Domain.Models;

public record User(Guid Id, string Name, string Email, string ConnectionId);
