#include "[ClassName].hpp"

[ClassName]::[ClassName]( void )
{
	if ([ClassName]::verbose)
		std::cout << "Default constructor for [ClassName] called" << std::endl;
	return;
}

[ClassName]::[ClassName]( [ClassName] const & src )
{
	if ([ClassName]::verbose)
		std::cout << "Copy constructor for [ClassName] called" << std::endl;
	*this = src;
	return;
}

[ClassName]::~[ClassName]( void )
{
	if ([ClassName]::verbose)
		std::cout << "Destructor for [ClassName] called" << std::endl;
	return;
}

[ClassName] &	[ClassName]::operator=( [ClassName] const & rhs )
{
	if ([ClassName]::verbose)
		std::cout << "Assignement operator for [ClassName] called" << std::endl;
	if (this == &src)
		return *this;

	return *this;
}

std::ostream &	operator<<( std::ostream & ostr, [ClassName] const & instance)
{
	ostr << "The value of [ClassName] is..." << std::endl;
	return ostr;
}

bool	[ClassName]::verbose = false;
