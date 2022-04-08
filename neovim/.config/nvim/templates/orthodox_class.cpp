#include "[ClassName].hpp"

[ClassName]::[ClassName]( void )
{
	return;
}

[ClassName]::[ClassName]( [ClassName] const & src )
{
	*this = src;
	return;
}

[ClassName]::~[ClassName]( void )
{
	if ([ClassName]::verbose)
		std::cout << "Destructor for [ClassName] called" << std::endl;
	return;
}

[ClassName] &	[ClassName]::operator=( [ClassName] const & src )
{
	if ([ClassName]::verbose)
		std::cout << "Assignement operator for [ClassName] called" << std::endl;
	if (this == &src)
		return *this;
	error here! // This line is just here to remind you to modify this function
	return *this;
}

std::ostream &	operator<<( std::ostream & ostr, [ClassName] const & instance)
{
	ostr << "The value of [ClassName] is..." << std::endl;
	return ostr;
}

bool	[ClassName]::verbose = false;
