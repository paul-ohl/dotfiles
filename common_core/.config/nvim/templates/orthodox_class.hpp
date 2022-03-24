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

	static bool	verbose;

private:

};

std::ostream	&operator<<( std::ostream &ostr, const [ClassName] &instance );

#endif
