INSERT INTO `User` (`id`, `email`, `name`, `avatarUrl`) VALUES
(1, 'alice@example.com', 'Alice', 'https://example.com/avatar1.png'),
(2, 'bob@example.com', 'Bob', 'https://example.com/avatar2.png'),
(3, 'carol@example.com', 'Carol', 'https://example.com/avatar3.png');

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing');

INSERT INTO `Offer` (`id`, `title`, `description`, `sum`, `images`, `ownerId`) VALUES
(1, 'iPhone 13 for Sale', 'Barely used iPhone 13 in excellent condition.', 700, '["https://example.com/iphone.jpg"]', 1),
(2, 'Learn JavaScript Book', 'A great book for learning JS basics and advanced topics.', 20, '["https://example.com/jsbook.jpg"]', 2),
(3, 'Men’s Jacket', 'Winter jacket, size L, barely worn.', 50, '["https://example.com/jacket.jpg"]', 3);

INSERT INTO `OfferToCategory` (`offerId`, `categoryId`) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO `Comment` (`id`, `text`, `userId`, `offerId`) VALUES
(1, 'Is this still available?', 2, 1),
(2, 'Can you ship internationally?', 3, 2),
(3, 'What’s the jacket’s material?', 1, 3);
