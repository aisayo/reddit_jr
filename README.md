# ActiveRecord Associations

## Belongs to

### what the table will look like:
- foriegn key => will be housed in child object tables(the object that belongs to another object)

- Belongs_to macro: provides methods to return associated object data
- 

## Has Many

## Has Many Through

author => has many posts, has many categories through posts
category => has many posts, has many authors through posts
post => belongs to an author, belong to a category 