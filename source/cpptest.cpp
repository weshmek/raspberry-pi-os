
class Base
{
	private:
	const int i;
	public:
	Base(int input) :
	i(input)
	{}

	virtual const int get(void) const
	{
		return i;
	}
};


class Derived : public Base
{
	private:
	const int x;
	public:
	Derived(int in1, int in2):
	Base(in1),
	x(in2)
	{}
	virtual const int get(void)
	{
		return x;
	}
	
};


int UseVirtual(Base *b)
{
	return b->get();
}


extern "C" int test_base(int i, int j)
{

	Base b(i);
	return b.get();
	
}

extern "C" int test_derived(int i, int j)
{
	Derived d(i, j);
	Base b = d;
	return b.get();
}
