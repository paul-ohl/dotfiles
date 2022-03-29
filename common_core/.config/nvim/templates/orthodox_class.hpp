#ifndef [CLASS_NAME]
# define [CLASS_NAME]

# include <iostream>

class [ClassName]
{

public:

	[ClassName]( void );
	[ClassName]( const [ClassName] &src );
	~[ClassName]( void );

	[ClassName]	&operator=( const [ClassName] &src );

private:

};

std::ostream	&operator<<( std::ostream &ostr, const [ClassName] &instance );

#endif
