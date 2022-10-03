// Generated by gencpp from file meno_matky_za_slobodna/DrawResponse.msg
// DO NOT EDIT!


#ifndef MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAWRESPONSE_H
#define MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAWRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace meno_matky_za_slobodna
{
template <class ContainerAllocator>
struct DrawResponse_
{
  typedef DrawResponse_<ContainerAllocator> Type;

  DrawResponse_()
    : success(false)  {
    }
  DrawResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DrawResponse_

typedef ::meno_matky_za_slobodna::DrawResponse_<std::allocator<void> > DrawResponse;

typedef boost::shared_ptr< ::meno_matky_za_slobodna::DrawResponse > DrawResponsePtr;
typedef boost::shared_ptr< ::meno_matky_za_slobodna::DrawResponse const> DrawResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator1> & lhs, const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator1> & lhs, const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace meno_matky_za_slobodna

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "meno_matky_za_slobodna/DrawResponse";
  }

  static const char* value(const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
;
  }

  static const char* value(const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DrawResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::meno_matky_za_slobodna::DrawResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAWRESPONSE_H
