//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_8bits" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(1, 10)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 6429
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _Distortion;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat8;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
bool u_xlatb21;
float u_xlat23;
void main()
{
    u_xlat0.z = 1000.0;
    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
    u_xlat2 = texture(_MainTex, u_xlat1.yx);
    u_xlat2.xyz = u_xlat2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.y = min(u_xlat21, 1000.0);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat4.xyz = bool(u_xlatb21) ? vec3(0.62890625, 0.30078125, 0.26171875) : vec3(0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb15 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb15)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = bool(u_xlatb21) ? u_xlat4.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat4.xyz;
    u_xlat5.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb15)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-05);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb21 = u_xlat0.x<u_xlat0.y;
    u_xlat2.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat3.xyz = (bool(u_xlatb21)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat4.xyz;
    u_xlatb21 = u_xlat2.x<u_xlat2.y;
    u_xlat15.xy = (bool(u_xlatb21)) ? u_xlat2.xy : u_xlat2.yz;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat3.xyz : u_xlat0.xyz;
    u_xlat2.xyz = (bool(u_xlatb21)) ? vec3(1.0, 1.0, 1.0) : u_xlat3.xyz;
    u_xlat21 = dot(u_xlat1.yx, vec2(8.5, 0.0500000007));
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 * 10000.0;
    u_xlat23 = dot(u_xlat1.xy, vec2(6.5, 0.5));
    u_xlat1.x = u_xlat1.x + u_xlat1.y;
    u_xlat8 = sin(u_xlat23);
    u_xlat8 = abs(u_xlat8) + 0.100000001;
    u_xlat21 = u_xlat21 * u_xlat8;
    u_xlat21 = fract(u_xlat21);
    u_xlat8 = u_xlat15.y + u_xlat15.x;
    u_xlat8 = u_xlat15.y / u_xlat8;
    u_xlat21 = u_xlat21 * 0.75 + u_xlat8;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = floor(u_xlat8);
    u_xlat1.x = (-u_xlat8) * 2.0 + u_xlat1.x;
    u_xlatb21 = u_xlat21<u_xlat1.x;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 865
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %19 %850 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 19 
                                             OpMemberDecorate %23 0 Offset 23 
                                             OpMemberDecorate %23 1 Offset 23 
                                             OpDecorate %23 Block 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %850 Location 850 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                 f32 %10 = OpConstant 3.674022E-40 
                                     %11 = OpTypeInt 32 0 
                                 u32 %12 = OpConstant 2 
                                     %13 = OpTypePointer Private %6 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Private %15 
                      Private f32_2* %17 = OpVariable Private 
                                     %18 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %22 = OpTypeVector %6 4 
                                     %23 = OpTypeStruct %6 %22 
                                     %24 = OpTypePointer Uniform %23 
       Uniform struct {f32; f32_4;}* %25 = OpVariable Uniform 
                                     %26 = OpTypeInt 32 1 
                                 i32 %27 = OpConstant 1 
                                     %28 = OpTypePointer Uniform %22 
                      Private f32_3* %37 = OpVariable Private 
                                     %38 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %39 = OpTypePointer UniformConstant %38 
UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
                                     %42 = OpTypeSampler 
                                     %43 = OpTypePointer UniformConstant %42 
            UniformConstant sampler* %44 = OpVariable UniformConstant 
                                     %46 = OpTypeSampledImage %38 
                                 i32 %53 = OpConstant 0 
                                     %54 = OpTypePointer Uniform %6 
                      Private f32_3* %67 = OpVariable Private 
                      Private f32_3* %71 = OpVariable Private 
                        Private f32* %75 = OpVariable Private 
                                 u32 %81 = OpConstant 1 
                                 f32 %86 = OpConstant 3.674022E-40 
                                 f32 %87 = OpConstant 3.674022E-40 
                                 f32 %88 = OpConstant 3.674022E-40 
                               f32_3 %89 = OpConstantComposite %86 %87 %88 
                                 u32 %94 = OpConstant 0 
                                     %96 = OpTypeBool 
                                     %97 = OpTypePointer Private %96 
                       Private bool* %98 = OpVariable Private 
                                    %105 = OpTypePointer Function %15 
                                f32 %118 = OpConstant 3.674022E-40 
                                f32 %119 = OpConstant 3.674022E-40 
                                f32 %120 = OpConstant 3.674022E-40 
                              f32_3 %121 = OpConstantComposite %118 %119 %120 
                                f32 %122 = OpConstant 3.674022E-40 
                              f32_3 %123 = OpConstantComposite %122 %122 %122 
                                    %124 = OpTypeVector %96 3 
                     Private f32_3* %127 = OpVariable Private 
                                f32 %131 = OpConstant 3.674022E-40 
                                f32 %132 = OpConstant 3.674022E-40 
                                f32 %133 = OpConstant 3.674022E-40 
                              f32_3 %134 = OpConstantComposite %131 %132 %133 
                                f32 %160 = OpConstant 3.674022E-40 
                                f32 %161 = OpConstant 3.674022E-40 
                                f32 %162 = OpConstant 3.674022E-40 
                              f32_3 %163 = OpConstantComposite %160 %161 %162 
                      Private bool* %169 = OpVariable Private 
                                    %188 = OpTypePointer Function %7 
                                f32 %199 = OpConstant 3.674022E-40 
                                f32 %200 = OpConstant 3.674022E-40 
                                f32 %201 = OpConstant 3.674022E-40 
                              f32_3 %202 = OpConstantComposite %199 %200 %201 
                                f32 %218 = OpConstant 3.674022E-40 
                                f32 %219 = OpConstant 3.674022E-40 
                                f32 %220 = OpConstant 3.674022E-40 
                              f32_3 %221 = OpConstantComposite %218 %219 %220 
                     Private f32_3* %225 = OpVariable Private 
                                f32 %229 = OpConstant 3.674022E-40 
                                f32 %230 = OpConstant 3.674022E-40 
                                f32 %231 = OpConstant 3.674022E-40 
                              f32_3 %232 = OpConstantComposite %229 %230 %231 
                                f32 %267 = OpConstant 3.674022E-40 
                                f32 %268 = OpConstant 3.674022E-40 
                                f32 %269 = OpConstant 3.674022E-40 
                              f32_3 %270 = OpConstantComposite %267 %268 %269 
                                f32 %277 = OpConstant 3.674022E-40 
                                f32 %278 = OpConstant 3.674022E-40 
                                f32 %279 = OpConstant 3.674022E-40 
                              f32_3 %280 = OpConstantComposite %277 %278 %279 
                                f32 %315 = OpConstant 3.674022E-40 
                                f32 %316 = OpConstant 3.674022E-40 
                                f32 %317 = OpConstant 3.674022E-40 
                              f32_3 %318 = OpConstantComposite %315 %316 %317 
                                f32 %325 = OpConstant 3.674022E-40 
                                f32 %326 = OpConstant 3.674022E-40 
                                f32 %327 = OpConstant 3.674022E-40 
                              f32_3 %328 = OpConstantComposite %325 %326 %327 
                                f32 %363 = OpConstant 3.674022E-40 
                                f32 %364 = OpConstant 3.674022E-40 
                                f32 %365 = OpConstant 3.674022E-40 
                              f32_3 %366 = OpConstantComposite %363 %364 %365 
                                f32 %373 = OpConstant 3.674022E-40 
                                f32 %374 = OpConstant 3.674022E-40 
                                f32 %375 = OpConstant 3.674022E-40 
                              f32_3 %376 = OpConstantComposite %373 %374 %375 
                                f32 %411 = OpConstant 3.674022E-40 
                                f32 %412 = OpConstant 3.674022E-40 
                                f32 %413 = OpConstant 3.674022E-40 
                              f32_3 %414 = OpConstantComposite %411 %412 %413 
                                f32 %421 = OpConstant 3.674022E-40 
                                f32 %422 = OpConstant 3.674022E-40 
                                f32 %423 = OpConstant 3.674022E-40 
                              f32_3 %424 = OpConstantComposite %421 %422 %423 
                                f32 %459 = OpConstant 3.674022E-40 
                                f32 %460 = OpConstant 3.674022E-40 
                                f32 %461 = OpConstant 3.674022E-40 
                              f32_3 %462 = OpConstantComposite %459 %460 %461 
                                f32 %469 = OpConstant 3.674022E-40 
                                f32 %470 = OpConstant 3.674022E-40 
                                f32 %471 = OpConstant 3.674022E-40 
                              f32_3 %472 = OpConstantComposite %469 %470 %471 
                                f32 %507 = OpConstant 3.674022E-40 
                                f32 %508 = OpConstant 3.674022E-40 
                                f32 %509 = OpConstant 3.674022E-40 
                              f32_3 %510 = OpConstantComposite %507 %508 %509 
                                f32 %517 = OpConstant 3.674022E-40 
                              f32_3 %518 = OpConstantComposite %517 %517 %517 
                                f32 %553 = OpConstant 3.674022E-40 
                              f32_3 %554 = OpConstantComposite %553 %553 %553 
                                f32 %561 = OpConstant 3.674022E-40 
                              f32_3 %562 = OpConstantComposite %561 %561 %561 
                                f32 %597 = OpConstant 3.674022E-40 
                              f32_3 %598 = OpConstantComposite %597 %597 %597 
                                f32 %605 = OpConstant 3.674022E-40 
                                f32 %606 = OpConstant 3.674022E-40 
                                f32 %607 = OpConstant 3.674022E-40 
                              f32_3 %608 = OpConstantComposite %605 %606 %607 
                                f32 %643 = OpConstant 3.674022E-40 
                                f32 %644 = OpConstant 3.674022E-40 
                                f32 %645 = OpConstant 3.674022E-40 
                              f32_3 %646 = OpConstantComposite %643 %644 %645 
                                f32 %653 = OpConstant 3.674022E-40 
                                f32 %654 = OpConstant 3.674022E-40 
                              f32_3 %655 = OpConstantComposite %653 %470 %654 
                                f32 %690 = OpConstant 3.674022E-40 
                                f32 %691 = OpConstant 3.674022E-40 
                              f32_3 %692 = OpConstantComposite %690 %508 %691 
                                f32 %699 = OpConstant 3.674022E-40 
                              f32_3 %700 = OpConstantComposite %699 %699 %699 
                                f32 %705 = OpConstant 3.674022E-40 
                              f32_3 %706 = OpConstantComposite %705 %705 %705 
                                f32 %745 = OpConstant 3.674022E-40 
                              f32_3 %746 = OpConstantComposite %745 %745 %745 
                     Private f32_2* %755 = OpVariable Private 
                                f32 %778 = OpConstant 3.674022E-40 
                              f32_3 %779 = OpConstantComposite %778 %778 %778 
                                f32 %785 = OpConstant 3.674022E-40 
                                f32 %786 = OpConstant 3.674022E-40 
                              f32_2 %787 = OpConstantComposite %785 %786 
                                f32 %792 = OpConstant 3.674022E-40 
                       Private f32* %794 = OpVariable Private 
                                f32 %796 = OpConstant 3.674022E-40 
                                f32 %797 = OpConstant 3.674022E-40 
                              f32_2 %798 = OpConstantComposite %796 %797 
                       Private f32* %806 = OpVariable Private 
                                f32 %811 = OpConstant 3.674022E-40 
                                f32 %828 = OpConstant 3.674022E-40 
                                f32 %839 = OpConstant 3.674022E-40 
                                    %849 = OpTypePointer Output %22 
                      Output f32_4* %850 = OpVariable Output 
                                u32 %861 = OpConstant 3 
                                    %862 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_2* %106 = OpVariable Function 
                    Function f32_2* %146 = OpVariable Function 
                    Function f32_2* %176 = OpVariable Function 
                    Function f32_3* %189 = OpVariable Function 
                    Function f32_3* %196 = OpVariable Function 
                    Function f32_3* %207 = OpVariable Function 
                    Function f32_3* %215 = OpVariable Function 
                    Function f32_2* %244 = OpVariable Function 
                    Function f32_3* %256 = OpVariable Function 
                    Function f32_3* %264 = OpVariable Function 
                    Function f32_2* %292 = OpVariable Function 
                    Function f32_3* %304 = OpVariable Function 
                    Function f32_3* %312 = OpVariable Function 
                    Function f32_2* %340 = OpVariable Function 
                    Function f32_3* %352 = OpVariable Function 
                    Function f32_3* %360 = OpVariable Function 
                    Function f32_2* %388 = OpVariable Function 
                    Function f32_3* %400 = OpVariable Function 
                    Function f32_3* %408 = OpVariable Function 
                    Function f32_2* %436 = OpVariable Function 
                    Function f32_3* %448 = OpVariable Function 
                    Function f32_3* %456 = OpVariable Function 
                    Function f32_2* %484 = OpVariable Function 
                    Function f32_3* %496 = OpVariable Function 
                    Function f32_3* %504 = OpVariable Function 
                    Function f32_2* %530 = OpVariable Function 
                    Function f32_3* %542 = OpVariable Function 
                    Function f32_3* %550 = OpVariable Function 
                    Function f32_2* %574 = OpVariable Function 
                    Function f32_3* %586 = OpVariable Function 
                    Function f32_3* %594 = OpVariable Function 
                    Function f32_2* %620 = OpVariable Function 
                    Function f32_3* %632 = OpVariable Function 
                    Function f32_3* %640 = OpVariable Function 
                    Function f32_2* %667 = OpVariable Function 
                    Function f32_3* %679 = OpVariable Function 
                    Function f32_3* %687 = OpVariable Function 
                    Function f32_2* %722 = OpVariable Function 
                    Function f32_3* %734 = OpVariable Function 
                    Function f32_3* %742 = OpVariable Function 
                    Function f32_2* %757 = OpVariable Function 
                    Function f32_3* %767 = OpVariable Function 
                    Function f32_3* %775 = OpVariable Function 
                    Function f32_3* %852 = OpVariable Function 
                        Private f32* %14 = OpAccessChain %9 %12 
                                             OpStore %14 %10 
                               f32_2 %20 = OpLoad vs_TEXCOORD0 
                               f32_2 %21 = OpVectorShuffle %20 %20 1 0 
                      Uniform f32_4* %29 = OpAccessChain %25 %27 
                               f32_4 %30 = OpLoad %29 
                               f32_2 %31 = OpVectorShuffle %30 %30 1 0 
                               f32_2 %32 = OpFMul %21 %31 
                      Uniform f32_4* %33 = OpAccessChain %25 %27 
                               f32_4 %34 = OpLoad %33 
                               f32_2 %35 = OpVectorShuffle %34 %34 3 2 
                               f32_2 %36 = OpFAdd %32 %35 
                                             OpStore %17 %36 
                 read_only Texture2D %41 = OpLoad %40 
                             sampler %45 = OpLoad %44 
          read_only Texture2DSampled %47 = OpSampledImage %41 %45 
                               f32_2 %48 = OpLoad %17 
                               f32_2 %49 = OpVectorShuffle %48 %48 1 0 
                               f32_4 %50 = OpImageSampleImplicitLod %47 %49 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                             OpStore %37 %51 
                               f32_3 %52 = OpLoad %37 
                        Uniform f32* %55 = OpAccessChain %25 %53 
                                 f32 %56 = OpLoad %55 
                        Uniform f32* %57 = OpAccessChain %25 %53 
                                 f32 %58 = OpLoad %57 
                        Uniform f32* %59 = OpAccessChain %25 %53 
                                 f32 %60 = OpLoad %59 
                               f32_3 %61 = OpCompositeConstruct %56 %58 %60 
                                 f32 %62 = OpCompositeExtract %61 0 
                                 f32 %63 = OpCompositeExtract %61 1 
                                 f32 %64 = OpCompositeExtract %61 2 
                               f32_3 %65 = OpCompositeConstruct %62 %63 %64 
                               f32_3 %66 = OpFAdd %52 %65 
                                             OpStore %37 %66 
                               f32_3 %68 = OpLoad %37 
                               f32_3 %69 = OpLoad %37 
                               f32_3 %70 = OpFMul %68 %69 
                                             OpStore %67 %70 
                               f32_3 %72 = OpLoad %37 
                               f32_3 %73 = OpLoad %67 
                               f32_3 %74 = OpFMul %72 %73 
                                             OpStore %71 %74 
                               f32_3 %76 = OpLoad %71 
                               f32_3 %77 = OpLoad %71 
                                 f32 %78 = OpDot %76 %77 
                                             OpStore %75 %78 
                                 f32 %79 = OpLoad %75 
                                 f32 %80 = OpExtInst %1 37 %79 %10 
                        Private f32* %82 = OpAccessChain %9 %81 
                                             OpStore %82 %80 
                               f32_3 %83 = OpLoad %37 
                               f32_3 %84 = OpLoad %67 
                               f32_3 %85 = OpFMul %83 %84 
                               f32_3 %90 = OpFAdd %85 %89 
                                             OpStore %71 %90 
                               f32_3 %91 = OpLoad %71 
                               f32_3 %92 = OpLoad %71 
                                 f32 %93 = OpDot %91 %92 
                        Private f32* %95 = OpAccessChain %9 %94 
                                             OpStore %95 %93 
                        Private f32* %99 = OpAccessChain %9 %94 
                                f32 %100 = OpLoad %99 
                       Private f32* %101 = OpAccessChain %9 %81 
                                f32 %102 = OpLoad %101 
                               bool %103 = OpFOrdLessThan %100 %102 
                                             OpStore %98 %103 
                               bool %104 = OpLoad %98 
                                             OpSelectionMerge %108 None 
                                             OpBranchConditional %104 %107 %111 
                                    %107 = OpLabel 
                              f32_3 %109 = OpLoad %9 
                              f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                             OpStore %106 %110 
                                             OpBranch %108 
                                    %111 = OpLabel 
                              f32_3 %112 = OpLoad %9 
                              f32_2 %113 = OpVectorShuffle %112 %112 1 2 
                                             OpStore %106 %113 
                                             OpBranch %108 
                                    %108 = OpLabel 
                              f32_2 %114 = OpLoad %106 
                              f32_3 %115 = OpLoad %9 
                              f32_3 %116 = OpVectorShuffle %115 %114 0 3 4 
                                             OpStore %9 %116 
                               bool %117 = OpLoad %98 
                             bool_3 %125 = OpCompositeConstruct %117 %117 %117 
                              f32_3 %126 = OpSelect %125 %121 %123 
                                             OpStore %71 %126 
                              f32_3 %128 = OpLoad %37 
                              f32_3 %129 = OpLoad %67 
                              f32_3 %130 = OpFMul %128 %129 
                              f32_3 %135 = OpFAdd %130 %134 
                                             OpStore %127 %135 
                              f32_3 %136 = OpLoad %127 
                              f32_3 %137 = OpLoad %127 
                                f32 %138 = OpDot %136 %137 
                       Private f32* %139 = OpAccessChain %9 %94 
                                             OpStore %139 %138 
                       Private f32* %140 = OpAccessChain %9 %94 
                                f32 %141 = OpLoad %140 
                       Private f32* %142 = OpAccessChain %9 %81 
                                f32 %143 = OpLoad %142 
                               bool %144 = OpFOrdLessThan %141 %143 
                                             OpStore %98 %144 
                               bool %145 = OpLoad %98 
                                             OpSelectionMerge %148 None 
                                             OpBranchConditional %145 %147 %151 
                                    %147 = OpLabel 
                              f32_3 %149 = OpLoad %9 
                              f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                             OpStore %146 %150 
                                             OpBranch %148 
                                    %151 = OpLabel 
                              f32_3 %152 = OpLoad %9 
                              f32_2 %153 = OpVectorShuffle %152 %152 1 2 
                                             OpStore %146 %153 
                                             OpBranch %148 
                                    %148 = OpLabel 
                              f32_2 %154 = OpLoad %146 
                              f32_3 %155 = OpLoad %9 
                              f32_3 %156 = OpVectorShuffle %155 %154 0 3 4 
                                             OpStore %9 %156 
                              f32_3 %157 = OpLoad %37 
                              f32_3 %158 = OpLoad %67 
                              f32_3 %159 = OpFMul %157 %158 
                              f32_3 %164 = OpFAdd %159 %163 
                                             OpStore %127 %164 
                              f32_3 %165 = OpLoad %127 
                              f32_3 %166 = OpLoad %127 
                                f32 %167 = OpDot %165 %166 
                       Private f32* %168 = OpAccessChain %9 %94 
                                             OpStore %168 %167 
                       Private f32* %170 = OpAccessChain %9 %94 
                                f32 %171 = OpLoad %170 
                       Private f32* %172 = OpAccessChain %9 %81 
                                f32 %173 = OpLoad %172 
                               bool %174 = OpFOrdLessThan %171 %173 
                                             OpStore %169 %174 
                               bool %175 = OpLoad %169 
                                             OpSelectionMerge %178 None 
                                             OpBranchConditional %175 %177 %181 
                                    %177 = OpLabel 
                              f32_3 %179 = OpLoad %9 
                              f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                             OpStore %176 %180 
                                             OpBranch %178 
                                    %181 = OpLabel 
                              f32_3 %182 = OpLoad %9 
                              f32_2 %183 = OpVectorShuffle %182 %182 1 2 
                                             OpStore %176 %183 
                                             OpBranch %178 
                                    %178 = OpLabel 
                              f32_2 %184 = OpLoad %176 
                              f32_3 %185 = OpLoad %9 
                              f32_3 %186 = OpVectorShuffle %185 %184 0 3 4 
                                             OpStore %9 %186 
                               bool %187 = OpLoad %98 
                                             OpSelectionMerge %191 None 
                                             OpBranchConditional %187 %190 %193 
                                    %190 = OpLabel 
                              f32_3 %192 = OpLoad %71 
                                             OpStore %189 %192 
                                             OpBranch %191 
                                    %193 = OpLabel 
                                             OpStore %189 %123 
                                             OpBranch %191 
                                    %191 = OpLabel 
                              f32_3 %194 = OpLoad %189 
                                             OpStore %127 %194 
                               bool %195 = OpLoad %98 
                                             OpSelectionMerge %198 None 
                                             OpBranchConditional %195 %197 %203 
                                    %197 = OpLabel 
                                             OpStore %196 %202 
                                             OpBranch %198 
                                    %203 = OpLabel 
                              f32_3 %204 = OpLoad %71 
                                             OpStore %196 %204 
                                             OpBranch %198 
                                    %198 = OpLabel 
                              f32_3 %205 = OpLoad %196 
                                             OpStore %71 %205 
                               bool %206 = OpLoad %169 
                                             OpSelectionMerge %209 None 
                                             OpBranchConditional %206 %208 %211 
                                    %208 = OpLabel 
                              f32_3 %210 = OpLoad %71 
                                             OpStore %207 %210 
                                             OpBranch %209 
                                    %211 = OpLabel 
                              f32_3 %212 = OpLoad %127 
                                             OpStore %207 %212 
                                             OpBranch %209 
                                    %209 = OpLabel 
                              f32_3 %213 = OpLoad %207 
                                             OpStore %127 %213 
                               bool %214 = OpLoad %169 
                                             OpSelectionMerge %217 None 
                                             OpBranchConditional %214 %216 %222 
                                    %216 = OpLabel 
                                             OpStore %215 %221 
                                             OpBranch %217 
                                    %222 = OpLabel 
                              f32_3 %223 = OpLoad %71 
                                             OpStore %215 %223 
                                             OpBranch %217 
                                    %217 = OpLabel 
                              f32_3 %224 = OpLoad %215 
                                             OpStore %71 %224 
                              f32_3 %226 = OpLoad %37 
                              f32_3 %227 = OpLoad %67 
                              f32_3 %228 = OpFMul %226 %227 
                              f32_3 %233 = OpFAdd %228 %232 
                                             OpStore %225 %233 
                              f32_3 %234 = OpLoad %225 
                              f32_3 %235 = OpLoad %225 
                                f32 %236 = OpDot %234 %235 
                       Private f32* %237 = OpAccessChain %9 %94 
                                             OpStore %237 %236 
                       Private f32* %238 = OpAccessChain %9 %94 
                                f32 %239 = OpLoad %238 
                       Private f32* %240 = OpAccessChain %9 %81 
                                f32 %241 = OpLoad %240 
                               bool %242 = OpFOrdLessThan %239 %241 
                                             OpStore %98 %242 
                               bool %243 = OpLoad %98 
                                             OpSelectionMerge %246 None 
                                             OpBranchConditional %243 %245 %249 
                                    %245 = OpLabel 
                              f32_3 %247 = OpLoad %9 
                              f32_2 %248 = OpVectorShuffle %247 %247 0 1 
                                             OpStore %244 %248 
                                             OpBranch %246 
                                    %249 = OpLabel 
                              f32_3 %250 = OpLoad %9 
                              f32_2 %251 = OpVectorShuffle %250 %250 1 2 
                                             OpStore %244 %251 
                                             OpBranch %246 
                                    %246 = OpLabel 
                              f32_2 %252 = OpLoad %244 
                              f32_3 %253 = OpLoad %9 
                              f32_3 %254 = OpVectorShuffle %253 %252 0 3 4 
                                             OpStore %9 %254 
                               bool %255 = OpLoad %98 
                                             OpSelectionMerge %258 None 
                                             OpBranchConditional %255 %257 %260 
                                    %257 = OpLabel 
                              f32_3 %259 = OpLoad %71 
                                             OpStore %256 %259 
                                             OpBranch %258 
                                    %260 = OpLabel 
                              f32_3 %261 = OpLoad %127 
                                             OpStore %256 %261 
                                             OpBranch %258 
                                    %258 = OpLabel 
                              f32_3 %262 = OpLoad %256 
                                             OpStore %127 %262 
                               bool %263 = OpLoad %98 
                                             OpSelectionMerge %266 None 
                                             OpBranchConditional %263 %265 %271 
                                    %265 = OpLabel 
                                             OpStore %264 %270 
                                             OpBranch %266 
                                    %271 = OpLabel 
                              f32_3 %272 = OpLoad %71 
                                             OpStore %264 %272 
                                             OpBranch %266 
                                    %266 = OpLabel 
                              f32_3 %273 = OpLoad %264 
                                             OpStore %71 %273 
                              f32_3 %274 = OpLoad %37 
                              f32_3 %275 = OpLoad %67 
                              f32_3 %276 = OpFMul %274 %275 
                              f32_3 %281 = OpFAdd %276 %280 
                                             OpStore %225 %281 
                              f32_3 %282 = OpLoad %225 
                              f32_3 %283 = OpLoad %225 
                                f32 %284 = OpDot %282 %283 
                       Private f32* %285 = OpAccessChain %9 %94 
                                             OpStore %285 %284 
                       Private f32* %286 = OpAccessChain %9 %94 
                                f32 %287 = OpLoad %286 
                       Private f32* %288 = OpAccessChain %9 %81 
                                f32 %289 = OpLoad %288 
                               bool %290 = OpFOrdLessThan %287 %289 
                                             OpStore %98 %290 
                               bool %291 = OpLoad %98 
                                             OpSelectionMerge %294 None 
                                             OpBranchConditional %291 %293 %297 
                                    %293 = OpLabel 
                              f32_3 %295 = OpLoad %9 
                              f32_2 %296 = OpVectorShuffle %295 %295 0 1 
                                             OpStore %292 %296 
                                             OpBranch %294 
                                    %297 = OpLabel 
                              f32_3 %298 = OpLoad %9 
                              f32_2 %299 = OpVectorShuffle %298 %298 1 2 
                                             OpStore %292 %299 
                                             OpBranch %294 
                                    %294 = OpLabel 
                              f32_2 %300 = OpLoad %292 
                              f32_3 %301 = OpLoad %9 
                              f32_3 %302 = OpVectorShuffle %301 %300 0 3 4 
                                             OpStore %9 %302 
                               bool %303 = OpLoad %98 
                                             OpSelectionMerge %306 None 
                                             OpBranchConditional %303 %305 %308 
                                    %305 = OpLabel 
                              f32_3 %307 = OpLoad %71 
                                             OpStore %304 %307 
                                             OpBranch %306 
                                    %308 = OpLabel 
                              f32_3 %309 = OpLoad %127 
                                             OpStore %304 %309 
                                             OpBranch %306 
                                    %306 = OpLabel 
                              f32_3 %310 = OpLoad %304 
                                             OpStore %127 %310 
                               bool %311 = OpLoad %98 
                                             OpSelectionMerge %314 None 
                                             OpBranchConditional %311 %313 %319 
                                    %313 = OpLabel 
                                             OpStore %312 %318 
                                             OpBranch %314 
                                    %319 = OpLabel 
                              f32_3 %320 = OpLoad %71 
                                             OpStore %312 %320 
                                             OpBranch %314 
                                    %314 = OpLabel 
                              f32_3 %321 = OpLoad %312 
                                             OpStore %71 %321 
                              f32_3 %322 = OpLoad %37 
                              f32_3 %323 = OpLoad %67 
                              f32_3 %324 = OpFMul %322 %323 
                              f32_3 %329 = OpFAdd %324 %328 
                                             OpStore %225 %329 
                              f32_3 %330 = OpLoad %225 
                              f32_3 %331 = OpLoad %225 
                                f32 %332 = OpDot %330 %331 
                       Private f32* %333 = OpAccessChain %9 %94 
                                             OpStore %333 %332 
                       Private f32* %334 = OpAccessChain %9 %94 
                                f32 %335 = OpLoad %334 
                       Private f32* %336 = OpAccessChain %9 %81 
                                f32 %337 = OpLoad %336 
                               bool %338 = OpFOrdLessThan %335 %337 
                                             OpStore %98 %338 
                               bool %339 = OpLoad %98 
                                             OpSelectionMerge %342 None 
                                             OpBranchConditional %339 %341 %345 
                                    %341 = OpLabel 
                              f32_3 %343 = OpLoad %9 
                              f32_2 %344 = OpVectorShuffle %343 %343 0 1 
                                             OpStore %340 %344 
                                             OpBranch %342 
                                    %345 = OpLabel 
                              f32_3 %346 = OpLoad %9 
                              f32_2 %347 = OpVectorShuffle %346 %346 1 2 
                                             OpStore %340 %347 
                                             OpBranch %342 
                                    %342 = OpLabel 
                              f32_2 %348 = OpLoad %340 
                              f32_3 %349 = OpLoad %9 
                              f32_3 %350 = OpVectorShuffle %349 %348 0 3 4 
                                             OpStore %9 %350 
                               bool %351 = OpLoad %98 
                                             OpSelectionMerge %354 None 
                                             OpBranchConditional %351 %353 %356 
                                    %353 = OpLabel 
                              f32_3 %355 = OpLoad %71 
                                             OpStore %352 %355 
                                             OpBranch %354 
                                    %356 = OpLabel 
                              f32_3 %357 = OpLoad %127 
                                             OpStore %352 %357 
                                             OpBranch %354 
                                    %354 = OpLabel 
                              f32_3 %358 = OpLoad %352 
                                             OpStore %127 %358 
                               bool %359 = OpLoad %98 
                                             OpSelectionMerge %362 None 
                                             OpBranchConditional %359 %361 %367 
                                    %361 = OpLabel 
                                             OpStore %360 %366 
                                             OpBranch %362 
                                    %367 = OpLabel 
                              f32_3 %368 = OpLoad %71 
                                             OpStore %360 %368 
                                             OpBranch %362 
                                    %362 = OpLabel 
                              f32_3 %369 = OpLoad %360 
                                             OpStore %71 %369 
                              f32_3 %370 = OpLoad %37 
                              f32_3 %371 = OpLoad %67 
                              f32_3 %372 = OpFMul %370 %371 
                              f32_3 %377 = OpFAdd %372 %376 
                                             OpStore %225 %377 
                              f32_3 %378 = OpLoad %225 
                              f32_3 %379 = OpLoad %225 
                                f32 %380 = OpDot %378 %379 
                       Private f32* %381 = OpAccessChain %9 %94 
                                             OpStore %381 %380 
                       Private f32* %382 = OpAccessChain %9 %94 
                                f32 %383 = OpLoad %382 
                       Private f32* %384 = OpAccessChain %9 %81 
                                f32 %385 = OpLoad %384 
                               bool %386 = OpFOrdLessThan %383 %385 
                                             OpStore %98 %386 
                               bool %387 = OpLoad %98 
                                             OpSelectionMerge %390 None 
                                             OpBranchConditional %387 %389 %393 
                                    %389 = OpLabel 
                              f32_3 %391 = OpLoad %9 
                              f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                             OpStore %388 %392 
                                             OpBranch %390 
                                    %393 = OpLabel 
                              f32_3 %394 = OpLoad %9 
                              f32_2 %395 = OpVectorShuffle %394 %394 1 2 
                                             OpStore %388 %395 
                                             OpBranch %390 
                                    %390 = OpLabel 
                              f32_2 %396 = OpLoad %388 
                              f32_3 %397 = OpLoad %9 
                              f32_3 %398 = OpVectorShuffle %397 %396 0 3 4 
                                             OpStore %9 %398 
                               bool %399 = OpLoad %98 
                                             OpSelectionMerge %402 None 
                                             OpBranchConditional %399 %401 %404 
                                    %401 = OpLabel 
                              f32_3 %403 = OpLoad %71 
                                             OpStore %400 %403 
                                             OpBranch %402 
                                    %404 = OpLabel 
                              f32_3 %405 = OpLoad %127 
                                             OpStore %400 %405 
                                             OpBranch %402 
                                    %402 = OpLabel 
                              f32_3 %406 = OpLoad %400 
                                             OpStore %127 %406 
                               bool %407 = OpLoad %98 
                                             OpSelectionMerge %410 None 
                                             OpBranchConditional %407 %409 %415 
                                    %409 = OpLabel 
                                             OpStore %408 %414 
                                             OpBranch %410 
                                    %415 = OpLabel 
                              f32_3 %416 = OpLoad %71 
                                             OpStore %408 %416 
                                             OpBranch %410 
                                    %410 = OpLabel 
                              f32_3 %417 = OpLoad %408 
                                             OpStore %71 %417 
                              f32_3 %418 = OpLoad %37 
                              f32_3 %419 = OpLoad %67 
                              f32_3 %420 = OpFMul %418 %419 
                              f32_3 %425 = OpFAdd %420 %424 
                                             OpStore %225 %425 
                              f32_3 %426 = OpLoad %225 
                              f32_3 %427 = OpLoad %225 
                                f32 %428 = OpDot %426 %427 
                       Private f32* %429 = OpAccessChain %9 %94 
                                             OpStore %429 %428 
                       Private f32* %430 = OpAccessChain %9 %94 
                                f32 %431 = OpLoad %430 
                       Private f32* %432 = OpAccessChain %9 %81 
                                f32 %433 = OpLoad %432 
                               bool %434 = OpFOrdLessThan %431 %433 
                                             OpStore %98 %434 
                               bool %435 = OpLoad %98 
                                             OpSelectionMerge %438 None 
                                             OpBranchConditional %435 %437 %441 
                                    %437 = OpLabel 
                              f32_3 %439 = OpLoad %9 
                              f32_2 %440 = OpVectorShuffle %439 %439 0 1 
                                             OpStore %436 %440 
                                             OpBranch %438 
                                    %441 = OpLabel 
                              f32_3 %442 = OpLoad %9 
                              f32_2 %443 = OpVectorShuffle %442 %442 1 2 
                                             OpStore %436 %443 
                                             OpBranch %438 
                                    %438 = OpLabel 
                              f32_2 %444 = OpLoad %436 
                              f32_3 %445 = OpLoad %9 
                              f32_3 %446 = OpVectorShuffle %445 %444 0 3 4 
                                             OpStore %9 %446 
                               bool %447 = OpLoad %98 
                                             OpSelectionMerge %450 None 
                                             OpBranchConditional %447 %449 %452 
                                    %449 = OpLabel 
                              f32_3 %451 = OpLoad %71 
                                             OpStore %448 %451 
                                             OpBranch %450 
                                    %452 = OpLabel 
                              f32_3 %453 = OpLoad %127 
                                             OpStore %448 %453 
                                             OpBranch %450 
                                    %450 = OpLabel 
                              f32_3 %454 = OpLoad %448 
                                             OpStore %127 %454 
                               bool %455 = OpLoad %98 
                                             OpSelectionMerge %458 None 
                                             OpBranchConditional %455 %457 %463 
                                    %457 = OpLabel 
                                             OpStore %456 %462 
                                             OpBranch %458 
                                    %463 = OpLabel 
                              f32_3 %464 = OpLoad %71 
                                             OpStore %456 %464 
                                             OpBranch %458 
                                    %458 = OpLabel 
                              f32_3 %465 = OpLoad %456 
                                             OpStore %71 %465 
                              f32_3 %466 = OpLoad %37 
                              f32_3 %467 = OpLoad %67 
                              f32_3 %468 = OpFMul %466 %467 
                              f32_3 %473 = OpFAdd %468 %472 
                                             OpStore %225 %473 
                              f32_3 %474 = OpLoad %225 
                              f32_3 %475 = OpLoad %225 
                                f32 %476 = OpDot %474 %475 
                       Private f32* %477 = OpAccessChain %9 %94 
                                             OpStore %477 %476 
                       Private f32* %478 = OpAccessChain %9 %94 
                                f32 %479 = OpLoad %478 
                       Private f32* %480 = OpAccessChain %9 %81 
                                f32 %481 = OpLoad %480 
                               bool %482 = OpFOrdLessThan %479 %481 
                                             OpStore %98 %482 
                               bool %483 = OpLoad %98 
                                             OpSelectionMerge %486 None 
                                             OpBranchConditional %483 %485 %489 
                                    %485 = OpLabel 
                              f32_3 %487 = OpLoad %9 
                              f32_2 %488 = OpVectorShuffle %487 %487 0 1 
                                             OpStore %484 %488 
                                             OpBranch %486 
                                    %489 = OpLabel 
                              f32_3 %490 = OpLoad %9 
                              f32_2 %491 = OpVectorShuffle %490 %490 1 2 
                                             OpStore %484 %491 
                                             OpBranch %486 
                                    %486 = OpLabel 
                              f32_2 %492 = OpLoad %484 
                              f32_3 %493 = OpLoad %9 
                              f32_3 %494 = OpVectorShuffle %493 %492 0 3 4 
                                             OpStore %9 %494 
                               bool %495 = OpLoad %98 
                                             OpSelectionMerge %498 None 
                                             OpBranchConditional %495 %497 %500 
                                    %497 = OpLabel 
                              f32_3 %499 = OpLoad %71 
                                             OpStore %496 %499 
                                             OpBranch %498 
                                    %500 = OpLabel 
                              f32_3 %501 = OpLoad %127 
                                             OpStore %496 %501 
                                             OpBranch %498 
                                    %498 = OpLabel 
                              f32_3 %502 = OpLoad %496 
                                             OpStore %127 %502 
                               bool %503 = OpLoad %98 
                                             OpSelectionMerge %506 None 
                                             OpBranchConditional %503 %505 %511 
                                    %505 = OpLabel 
                                             OpStore %504 %510 
                                             OpBranch %506 
                                    %511 = OpLabel 
                              f32_3 %512 = OpLoad %71 
                                             OpStore %504 %512 
                                             OpBranch %506 
                                    %506 = OpLabel 
                              f32_3 %513 = OpLoad %504 
                                             OpStore %71 %513 
                              f32_3 %514 = OpLoad %37 
                              f32_3 %515 = OpLoad %67 
                              f32_3 %516 = OpFMul %514 %515 
                              f32_3 %519 = OpFAdd %516 %518 
                                             OpStore %225 %519 
                              f32_3 %520 = OpLoad %225 
                              f32_3 %521 = OpLoad %225 
                                f32 %522 = OpDot %520 %521 
                       Private f32* %523 = OpAccessChain %9 %94 
                                             OpStore %523 %522 
                       Private f32* %524 = OpAccessChain %9 %94 
                                f32 %525 = OpLoad %524 
                       Private f32* %526 = OpAccessChain %9 %81 
                                f32 %527 = OpLoad %526 
                               bool %528 = OpFOrdLessThan %525 %527 
                                             OpStore %98 %528 
                               bool %529 = OpLoad %98 
                                             OpSelectionMerge %532 None 
                                             OpBranchConditional %529 %531 %535 
                                    %531 = OpLabel 
                              f32_3 %533 = OpLoad %9 
                              f32_2 %534 = OpVectorShuffle %533 %533 0 1 
                                             OpStore %530 %534 
                                             OpBranch %532 
                                    %535 = OpLabel 
                              f32_3 %536 = OpLoad %9 
                              f32_2 %537 = OpVectorShuffle %536 %536 1 2 
                                             OpStore %530 %537 
                                             OpBranch %532 
                                    %532 = OpLabel 
                              f32_2 %538 = OpLoad %530 
                              f32_3 %539 = OpLoad %9 
                              f32_3 %540 = OpVectorShuffle %539 %538 0 3 4 
                                             OpStore %9 %540 
                               bool %541 = OpLoad %98 
                                             OpSelectionMerge %544 None 
                                             OpBranchConditional %541 %543 %546 
                                    %543 = OpLabel 
                              f32_3 %545 = OpLoad %71 
                                             OpStore %542 %545 
                                             OpBranch %544 
                                    %546 = OpLabel 
                              f32_3 %547 = OpLoad %127 
                                             OpStore %542 %547 
                                             OpBranch %544 
                                    %544 = OpLabel 
                              f32_3 %548 = OpLoad %542 
                                             OpStore %127 %548 
                               bool %549 = OpLoad %98 
                                             OpSelectionMerge %552 None 
                                             OpBranchConditional %549 %551 %555 
                                    %551 = OpLabel 
                                             OpStore %550 %554 
                                             OpBranch %552 
                                    %555 = OpLabel 
                              f32_3 %556 = OpLoad %71 
                                             OpStore %550 %556 
                                             OpBranch %552 
                                    %552 = OpLabel 
                              f32_3 %557 = OpLoad %550 
                                             OpStore %71 %557 
                              f32_3 %558 = OpLoad %37 
                              f32_3 %559 = OpLoad %67 
                              f32_3 %560 = OpFMul %558 %559 
                              f32_3 %563 = OpFAdd %560 %562 
                                             OpStore %225 %563 
                              f32_3 %564 = OpLoad %225 
                              f32_3 %565 = OpLoad %225 
                                f32 %566 = OpDot %564 %565 
                       Private f32* %567 = OpAccessChain %9 %94 
                                             OpStore %567 %566 
                       Private f32* %568 = OpAccessChain %9 %94 
                                f32 %569 = OpLoad %568 
                       Private f32* %570 = OpAccessChain %9 %81 
                                f32 %571 = OpLoad %570 
                               bool %572 = OpFOrdLessThan %569 %571 
                                             OpStore %98 %572 
                               bool %573 = OpLoad %98 
                                             OpSelectionMerge %576 None 
                                             OpBranchConditional %573 %575 %579 
                                    %575 = OpLabel 
                              f32_3 %577 = OpLoad %9 
                              f32_2 %578 = OpVectorShuffle %577 %577 0 1 
                                             OpStore %574 %578 
                                             OpBranch %576 
                                    %579 = OpLabel 
                              f32_3 %580 = OpLoad %9 
                              f32_2 %581 = OpVectorShuffle %580 %580 1 2 
                                             OpStore %574 %581 
                                             OpBranch %576 
                                    %576 = OpLabel 
                              f32_2 %582 = OpLoad %574 
                              f32_3 %583 = OpLoad %9 
                              f32_3 %584 = OpVectorShuffle %583 %582 0 3 4 
                                             OpStore %9 %584 
                               bool %585 = OpLoad %98 
                                             OpSelectionMerge %588 None 
                                             OpBranchConditional %585 %587 %590 
                                    %587 = OpLabel 
                              f32_3 %589 = OpLoad %71 
                                             OpStore %586 %589 
                                             OpBranch %588 
                                    %590 = OpLabel 
                              f32_3 %591 = OpLoad %127 
                                             OpStore %586 %591 
                                             OpBranch %588 
                                    %588 = OpLabel 
                              f32_3 %592 = OpLoad %586 
                                             OpStore %127 %592 
                               bool %593 = OpLoad %98 
                                             OpSelectionMerge %596 None 
                                             OpBranchConditional %593 %595 %599 
                                    %595 = OpLabel 
                                             OpStore %594 %598 
                                             OpBranch %596 
                                    %599 = OpLabel 
                              f32_3 %600 = OpLoad %71 
                                             OpStore %594 %600 
                                             OpBranch %596 
                                    %596 = OpLabel 
                              f32_3 %601 = OpLoad %594 
                                             OpStore %71 %601 
                              f32_3 %602 = OpLoad %37 
                              f32_3 %603 = OpLoad %67 
                              f32_3 %604 = OpFMul %602 %603 
                              f32_3 %609 = OpFAdd %604 %608 
                                             OpStore %225 %609 
                              f32_3 %610 = OpLoad %225 
                              f32_3 %611 = OpLoad %225 
                                f32 %612 = OpDot %610 %611 
                       Private f32* %613 = OpAccessChain %9 %94 
                                             OpStore %613 %612 
                       Private f32* %614 = OpAccessChain %9 %94 
                                f32 %615 = OpLoad %614 
                       Private f32* %616 = OpAccessChain %9 %81 
                                f32 %617 = OpLoad %616 
                               bool %618 = OpFOrdLessThan %615 %617 
                                             OpStore %98 %618 
                               bool %619 = OpLoad %98 
                                             OpSelectionMerge %622 None 
                                             OpBranchConditional %619 %621 %625 
                                    %621 = OpLabel 
                              f32_3 %623 = OpLoad %9 
                              f32_2 %624 = OpVectorShuffle %623 %623 0 1 
                                             OpStore %620 %624 
                                             OpBranch %622 
                                    %625 = OpLabel 
                              f32_3 %626 = OpLoad %9 
                              f32_2 %627 = OpVectorShuffle %626 %626 1 2 
                                             OpStore %620 %627 
                                             OpBranch %622 
                                    %622 = OpLabel 
                              f32_2 %628 = OpLoad %620 
                              f32_3 %629 = OpLoad %9 
                              f32_3 %630 = OpVectorShuffle %629 %628 0 3 4 
                                             OpStore %9 %630 
                               bool %631 = OpLoad %98 
                                             OpSelectionMerge %634 None 
                                             OpBranchConditional %631 %633 %636 
                                    %633 = OpLabel 
                              f32_3 %635 = OpLoad %71 
                                             OpStore %632 %635 
                                             OpBranch %634 
                                    %636 = OpLabel 
                              f32_3 %637 = OpLoad %127 
                                             OpStore %632 %637 
                                             OpBranch %634 
                                    %634 = OpLabel 
                              f32_3 %638 = OpLoad %632 
                                             OpStore %127 %638 
                               bool %639 = OpLoad %98 
                                             OpSelectionMerge %642 None 
                                             OpBranchConditional %639 %641 %647 
                                    %641 = OpLabel 
                                             OpStore %640 %646 
                                             OpBranch %642 
                                    %647 = OpLabel 
                              f32_3 %648 = OpLoad %71 
                                             OpStore %640 %648 
                                             OpBranch %642 
                                    %642 = OpLabel 
                              f32_3 %649 = OpLoad %640 
                                             OpStore %71 %649 
                              f32_3 %650 = OpLoad %37 
                              f32_3 %651 = OpLoad %67 
                              f32_3 %652 = OpFMul %650 %651 
                              f32_3 %656 = OpFAdd %652 %655 
                                             OpStore %225 %656 
                              f32_3 %657 = OpLoad %225 
                              f32_3 %658 = OpLoad %225 
                                f32 %659 = OpDot %657 %658 
                       Private f32* %660 = OpAccessChain %9 %94 
                                             OpStore %660 %659 
                       Private f32* %661 = OpAccessChain %9 %94 
                                f32 %662 = OpLoad %661 
                       Private f32* %663 = OpAccessChain %9 %81 
                                f32 %664 = OpLoad %663 
                               bool %665 = OpFOrdLessThan %662 %664 
                                             OpStore %98 %665 
                               bool %666 = OpLoad %98 
                                             OpSelectionMerge %669 None 
                                             OpBranchConditional %666 %668 %672 
                                    %668 = OpLabel 
                              f32_3 %670 = OpLoad %9 
                              f32_2 %671 = OpVectorShuffle %670 %670 0 1 
                                             OpStore %667 %671 
                                             OpBranch %669 
                                    %672 = OpLabel 
                              f32_3 %673 = OpLoad %9 
                              f32_2 %674 = OpVectorShuffle %673 %673 1 2 
                                             OpStore %667 %674 
                                             OpBranch %669 
                                    %669 = OpLabel 
                              f32_2 %675 = OpLoad %667 
                              f32_3 %676 = OpLoad %9 
                              f32_3 %677 = OpVectorShuffle %676 %675 0 3 4 
                                             OpStore %9 %677 
                               bool %678 = OpLoad %98 
                                             OpSelectionMerge %681 None 
                                             OpBranchConditional %678 %680 %683 
                                    %680 = OpLabel 
                              f32_3 %682 = OpLoad %71 
                                             OpStore %679 %682 
                                             OpBranch %681 
                                    %683 = OpLabel 
                              f32_3 %684 = OpLoad %127 
                                             OpStore %679 %684 
                                             OpBranch %681 
                                    %681 = OpLabel 
                              f32_3 %685 = OpLoad %679 
                                             OpStore %127 %685 
                               bool %686 = OpLoad %98 
                                             OpSelectionMerge %689 None 
                                             OpBranchConditional %686 %688 %693 
                                    %688 = OpLabel 
                                             OpStore %687 %692 
                                             OpBranch %689 
                                    %693 = OpLabel 
                              f32_3 %694 = OpLoad %71 
                                             OpStore %687 %694 
                                             OpBranch %689 
                                    %689 = OpLabel 
                              f32_3 %695 = OpLoad %687 
                                             OpStore %71 %695 
                              f32_3 %696 = OpLoad %37 
                              f32_3 %697 = OpLoad %67 
                              f32_3 %698 = OpFMul %696 %697 
                              f32_3 %701 = OpFAdd %698 %700 
                                             OpStore %225 %701 
                              f32_3 %702 = OpLoad %37 
                              f32_3 %703 = OpLoad %67 
                              f32_3 %704 = OpFMul %702 %703 
                              f32_3 %707 = OpFAdd %704 %706 
                                             OpStore %37 %707 
                              f32_3 %708 = OpLoad %37 
                              f32_3 %709 = OpLoad %37 
                                f32 %710 = OpDot %708 %709 
                       Private f32* %711 = OpAccessChain %37 %94 
                                             OpStore %711 %710 
                              f32_3 %712 = OpLoad %225 
                              f32_3 %713 = OpLoad %225 
                                f32 %714 = OpDot %712 %713 
                       Private f32* %715 = OpAccessChain %9 %94 
                                             OpStore %715 %714 
                       Private f32* %716 = OpAccessChain %9 %94 
                                f32 %717 = OpLoad %716 
                       Private f32* %718 = OpAccessChain %9 %81 
                                f32 %719 = OpLoad %718 
                               bool %720 = OpFOrdLessThan %717 %719 
                                             OpStore %98 %720 
                               bool %721 = OpLoad %98 
                                             OpSelectionMerge %724 None 
                                             OpBranchConditional %721 %723 %727 
                                    %723 = OpLabel 
                              f32_3 %725 = OpLoad %9 
                              f32_2 %726 = OpVectorShuffle %725 %725 0 1 
                                             OpStore %722 %726 
                                             OpBranch %724 
                                    %727 = OpLabel 
                              f32_3 %728 = OpLoad %9 
                              f32_2 %729 = OpVectorShuffle %728 %728 1 2 
                                             OpStore %722 %729 
                                             OpBranch %724 
                                    %724 = OpLabel 
                              f32_2 %730 = OpLoad %722 
                              f32_3 %731 = OpLoad %37 
                              f32_3 %732 = OpVectorShuffle %731 %730 0 3 4 
                                             OpStore %37 %732 
                               bool %733 = OpLoad %98 
                                             OpSelectionMerge %736 None 
                                             OpBranchConditional %733 %735 %738 
                                    %735 = OpLabel 
                              f32_3 %737 = OpLoad %71 
                                             OpStore %734 %737 
                                             OpBranch %736 
                                    %738 = OpLabel 
                              f32_3 %739 = OpLoad %127 
                                             OpStore %734 %739 
                                             OpBranch %736 
                                    %736 = OpLabel 
                              f32_3 %740 = OpLoad %734 
                                             OpStore %9 %740 
                               bool %741 = OpLoad %98 
                                             OpSelectionMerge %744 None 
                                             OpBranchConditional %741 %743 %747 
                                    %743 = OpLabel 
                                             OpStore %742 %746 
                                             OpBranch %744 
                                    %747 = OpLabel 
                              f32_3 %748 = OpLoad %71 
                                             OpStore %742 %748 
                                             OpBranch %744 
                                    %744 = OpLabel 
                              f32_3 %749 = OpLoad %742 
                                             OpStore %67 %749 
                       Private f32* %750 = OpAccessChain %37 %94 
                                f32 %751 = OpLoad %750 
                       Private f32* %752 = OpAccessChain %37 %81 
                                f32 %753 = OpLoad %752 
                               bool %754 = OpFOrdLessThan %751 %753 
                                             OpStore %98 %754 
                               bool %756 = OpLoad %98 
                                             OpSelectionMerge %759 None 
                                             OpBranchConditional %756 %758 %762 
                                    %758 = OpLabel 
                              f32_3 %760 = OpLoad %37 
                              f32_2 %761 = OpVectorShuffle %760 %760 0 1 
                                             OpStore %757 %761 
                                             OpBranch %759 
                                    %762 = OpLabel 
                              f32_3 %763 = OpLoad %37 
                              f32_2 %764 = OpVectorShuffle %763 %763 1 2 
                                             OpStore %757 %764 
                                             OpBranch %759 
                                    %759 = OpLabel 
                              f32_2 %765 = OpLoad %757 
                                             OpStore %755 %765 
                               bool %766 = OpLoad %98 
                                             OpSelectionMerge %769 None 
                                             OpBranchConditional %766 %768 %771 
                                    %768 = OpLabel 
                              f32_3 %770 = OpLoad %67 
                                             OpStore %767 %770 
                                             OpBranch %769 
                                    %771 = OpLabel 
                              f32_3 %772 = OpLoad %9 
                                             OpStore %767 %772 
                                             OpBranch %769 
                                    %769 = OpLabel 
                              f32_3 %773 = OpLoad %767 
                                             OpStore %9 %773 
                               bool %774 = OpLoad %98 
                                             OpSelectionMerge %777 None 
                                             OpBranchConditional %774 %776 %780 
                                    %776 = OpLabel 
                                             OpStore %775 %779 
                                             OpBranch %777 
                                    %780 = OpLabel 
                              f32_3 %781 = OpLoad %67 
                                             OpStore %775 %781 
                                             OpBranch %777 
                                    %777 = OpLabel 
                              f32_3 %782 = OpLoad %775 
                                             OpStore %37 %782 
                              f32_2 %783 = OpLoad %17 
                              f32_2 %784 = OpVectorShuffle %783 %783 1 0 
                                f32 %788 = OpDot %784 %787 
                                             OpStore %75 %788 
                                f32 %789 = OpLoad %75 
                                f32 %790 = OpExtInst %1 13 %789 
                                             OpStore %75 %790 
                                f32 %791 = OpLoad %75 
                                f32 %793 = OpFMul %791 %792 
                                             OpStore %75 %793 
                              f32_2 %795 = OpLoad %17 
                                f32 %799 = OpDot %795 %798 
                                             OpStore %794 %799 
                       Private f32* %800 = OpAccessChain %17 %94 
                                f32 %801 = OpLoad %800 
                       Private f32* %802 = OpAccessChain %17 %81 
                                f32 %803 = OpLoad %802 
                                f32 %804 = OpFAdd %801 %803 
                       Private f32* %805 = OpAccessChain %17 %94 
                                             OpStore %805 %804 
                                f32 %807 = OpLoad %794 
                                f32 %808 = OpExtInst %1 13 %807 
                                             OpStore %806 %808 
                                f32 %809 = OpLoad %806 
                                f32 %810 = OpExtInst %1 4 %809 
                                f32 %812 = OpFAdd %810 %811 
                                             OpStore %806 %812 
                                f32 %813 = OpLoad %75 
                                f32 %814 = OpLoad %806 
                                f32 %815 = OpFMul %813 %814 
                                             OpStore %75 %815 
                                f32 %816 = OpLoad %75 
                                f32 %817 = OpExtInst %1 10 %816 
                                             OpStore %75 %817 
                       Private f32* %818 = OpAccessChain %755 %81 
                                f32 %819 = OpLoad %818 
                       Private f32* %820 = OpAccessChain %755 %94 
                                f32 %821 = OpLoad %820 
                                f32 %822 = OpFAdd %819 %821 
                                             OpStore %806 %822 
                       Private f32* %823 = OpAccessChain %755 %81 
                                f32 %824 = OpLoad %823 
                                f32 %825 = OpLoad %806 
                                f32 %826 = OpFDiv %824 %825 
                                             OpStore %806 %826 
                                f32 %827 = OpLoad %75 
                                f32 %829 = OpFMul %827 %828 
                                f32 %830 = OpLoad %806 
                                f32 %831 = OpFAdd %829 %830 
                                             OpStore %75 %831 
                       Private f32* %832 = OpAccessChain %17 %94 
                                f32 %833 = OpLoad %832 
                                f32 %834 = OpFMul %833 %797 
                                             OpStore %806 %834 
                                f32 %835 = OpLoad %806 
                                f32 %836 = OpExtInst %1 8 %835 
                                             OpStore %806 %836 
                                f32 %837 = OpLoad %806 
                                f32 %838 = OpFNegate %837 
                                f32 %840 = OpFMul %838 %839 
                       Private f32* %841 = OpAccessChain %17 %94 
                                f32 %842 = OpLoad %841 
                                f32 %843 = OpFAdd %840 %842 
                       Private f32* %844 = OpAccessChain %17 %94 
                                             OpStore %844 %843 
                                f32 %845 = OpLoad %75 
                       Private f32* %846 = OpAccessChain %17 %94 
                                f32 %847 = OpLoad %846 
                               bool %848 = OpFOrdLessThan %845 %847 
                                             OpStore %98 %848 
                               bool %851 = OpLoad %98 
                                             OpSelectionMerge %854 None 
                                             OpBranchConditional %851 %853 %856 
                                    %853 = OpLabel 
                              f32_3 %855 = OpLoad %9 
                                             OpStore %852 %855 
                                             OpBranch %854 
                                    %856 = OpLabel 
                              f32_3 %857 = OpLoad %37 
                                             OpStore %852 %857 
                                             OpBranch %854 
                                    %854 = OpLabel 
                              f32_3 %858 = OpLoad %852 
                              f32_4 %859 = OpLoad %850 
                              f32_4 %860 = OpVectorShuffle %859 %858 4 5 6 3 
                                             OpStore %850 %860 
                        Output f32* %863 = OpAccessChain %850 %861 
                                             OpStore %863 %778 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}