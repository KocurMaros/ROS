// Generated by gencpp from file meno_matky_za_slobodna/Draw.msg
// DO NOT EDIT!


#ifndef MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAW_H
#define MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAW_H

#include <ros/service_traits.h>


#include <meno_matky_za_slobodna/DrawRequest.h>
#include <meno_matky_za_slobodna/DrawResponse.h>


namespace meno_matky_za_slobodna
{

struct Draw
{

typedef DrawRequest Request;
typedef DrawResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Draw
} // namespace meno_matky_za_slobodna


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::meno_matky_za_slobodna::Draw > {
  static const char* value()
  {
    return "2ffd6e0fc173594a685f86a9d4366967";
  }

  static const char* value(const ::meno_matky_za_slobodna::Draw&) { return value(); }
};

template<>
struct DataType< ::meno_matky_za_slobodna::Draw > {
  static const char* value()
  {
    return "meno_matky_za_slobodna/Draw";
  }

  static const char* value(const ::meno_matky_za_slobodna::Draw&) { return value(); }
};


// service_traits::MD5Sum< ::meno_matky_za_slobodna::DrawRequest> should match
// service_traits::MD5Sum< ::meno_matky_za_slobodna::Draw >
template<>
struct MD5Sum< ::meno_matky_za_slobodna::DrawRequest>
{
  static const char* value()
  {
    return MD5Sum< ::meno_matky_za_slobodna::Draw >::value();
  }
  static const char* value(const ::meno_matky_za_slobodna::DrawRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::meno_matky_za_slobodna::DrawRequest> should match
// service_traits::DataType< ::meno_matky_za_slobodna::Draw >
template<>
struct DataType< ::meno_matky_za_slobodna::DrawRequest>
{
  static const char* value()
  {
    return DataType< ::meno_matky_za_slobodna::Draw >::value();
  }
  static const char* value(const ::meno_matky_za_slobodna::DrawRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::meno_matky_za_slobodna::DrawResponse> should match
// service_traits::MD5Sum< ::meno_matky_za_slobodna::Draw >
template<>
struct MD5Sum< ::meno_matky_za_slobodna::DrawResponse>
{
  static const char* value()
  {
    return MD5Sum< ::meno_matky_za_slobodna::Draw >::value();
  }
  static const char* value(const ::meno_matky_za_slobodna::DrawResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::meno_matky_za_slobodna::DrawResponse> should match
// service_traits::DataType< ::meno_matky_za_slobodna::Draw >
template<>
struct DataType< ::meno_matky_za_slobodna::DrawResponse>
{
  static const char* value()
  {
    return DataType< ::meno_matky_za_slobodna::Draw >::value();
  }
  static const char* value(const ::meno_matky_za_slobodna::DrawResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MENO_MATKY_ZA_SLOBODNA_MESSAGE_DRAW_H
