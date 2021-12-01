//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "IES/IESToCubemap" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 14899
Program "vp" {
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat4 = max(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb2 = u_xlatb4 && u_xlatb2;
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 3.14159012;
    u_xlat0.x = u_xlat0.x * 0.159155071;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat4 = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = (-u_xlat4) * -0.636620283 + 1.0;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = 0.0>=vs_TEXCOORD1.y;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 275
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %268 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %250 DescriptorSet 250 
                                              OpDecorate %250 Binding 250 
                                              OpDecorate %254 DescriptorSet 254 
                                              OpDecorate %254 Binding 254 
                                              OpDecorate %268 Location 268 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                       Private bool* %129 = OpVariable Private 
                                     %138 = OpTypePointer Function %6 
                                 f32 %152 = OpConstant 3.674022E-40 
                                 f32 %157 = OpConstant 3.674022E-40 
                                     %160 = OpTypeVector %6 2 
                        Private f32* %168 = OpVariable Private 
                                 u32 %170 = OpConstant 1 
                        Private f32* %177 = OpVariable Private 
                        Private f32* %189 = OpVariable Private 
                       Private bool* %211 = OpVariable Private 
                                 f32 %244 = OpConstant 3.674022E-40 
                                     %248 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %249 = OpTypePointer UniformConstant %248 
UniformConstant read_only Texture2D* %250 = OpVariable UniformConstant 
                                     %252 = OpTypeSampler 
                                     %253 = OpTypePointer UniformConstant %252 
            UniformConstant sampler* %254 = OpVariable UniformConstant 
                                     %256 = OpTypeSampledImage %248 
                                     %267 = OpTypePointer Output %10 
                       Output f32_4* %268 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %139 = OpVariable Function 
                       Function f32* %234 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 37 %116 %118 
                                              OpStore %31 %119 
                                 f32 %120 = OpLoad %31 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpFNegate %121 
                                bool %123 = OpFOrdLessThan %120 %122 
                                              OpStore %100 %123 
                          Input f32* %124 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %125 = OpLoad %124 
                          Input f32* %126 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %127 = OpLoad %126 
                                 f32 %128 = OpExtInst %1 40 %125 %127 
                                              OpStore %49 %128 
                                 f32 %130 = OpLoad %49 
                                 f32 %131 = OpLoad %49 
                                 f32 %132 = OpFNegate %131 
                                bool %133 = OpFOrdGreaterThanEqual %130 %132 
                                              OpStore %129 %133 
                                bool %134 = OpLoad %129 
                                bool %135 = OpLoad %100 
                                bool %136 = OpLogicalAnd %134 %135 
                                              OpStore %100 %136 
                                bool %137 = OpLoad %100 
                                              OpSelectionMerge %141 None 
                                              OpBranchConditional %137 %140 %145 
                                     %140 = OpLabel 
                        Private f32* %142 = OpAccessChain %9 %14 
                                 f32 %143 = OpLoad %142 
                                 f32 %144 = OpFNegate %143 
                                              OpStore %139 %144 
                                              OpBranch %141 
                                     %145 = OpLabel 
                        Private f32* %146 = OpAccessChain %9 %14 
                                 f32 %147 = OpLoad %146 
                                              OpStore %139 %147 
                                              OpBranch %141 
                                     %141 = OpLabel 
                                 f32 %148 = OpLoad %139 
                        Private f32* %149 = OpAccessChain %9 %14 
                                              OpStore %149 %148 
                        Private f32* %150 = OpAccessChain %9 %14 
                                 f32 %151 = OpLoad %150 
                                 f32 %153 = OpFAdd %151 %152 
                        Private f32* %154 = OpAccessChain %9 %14 
                                              OpStore %154 %153 
                        Private f32* %155 = OpAccessChain %9 %14 
                                 f32 %156 = OpLoad %155 
                                 f32 %158 = OpFMul %156 %157 
                        Private f32* %159 = OpAccessChain %9 %14 
                                              OpStore %159 %158 
                               f32_4 %161 = OpLoad vs_TEXCOORD1 
                               f32_2 %162 = OpVectorShuffle %161 %161 0 2 
                               f32_4 %163 = OpLoad vs_TEXCOORD1 
                               f32_2 %164 = OpVectorShuffle %163 %163 0 2 
                                 f32 %165 = OpDot %162 %164 
                                              OpStore %49 %165 
                                 f32 %166 = OpLoad %49 
                                 f32 %167 = OpExtInst %1 31 %166 
                                              OpStore %49 %167 
                                 f32 %169 = OpLoad %49 
                          Input f32* %171 = OpAccessChain vs_TEXCOORD1 %170 
                                 f32 %172 = OpLoad %171 
                                 f32 %173 = OpExtInst %1 4 %172 
                                 f32 %174 = OpExtInst %1 40 %169 %173 
                                              OpStore %168 %174 
                                 f32 %175 = OpLoad %168 
                                 f32 %176 = OpFDiv %26 %175 
                                              OpStore %168 %176 
                                 f32 %178 = OpLoad %49 
                          Input f32* %179 = OpAccessChain vs_TEXCOORD1 %170 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpExtInst %1 4 %180 
                                 f32 %182 = OpExtInst %1 37 %178 %181 
                                              OpStore %177 %182 
                                 f32 %183 = OpLoad %168 
                                 f32 %184 = OpLoad %177 
                                 f32 %185 = OpFMul %183 %184 
                                              OpStore %168 %185 
                                 f32 %186 = OpLoad %168 
                                 f32 %187 = OpLoad %168 
                                 f32 %188 = OpFMul %186 %187 
                                              OpStore %177 %188 
                                 f32 %190 = OpLoad %177 
                                 f32 %191 = OpFMul %190 %51 
                                 f32 %192 = OpFAdd %191 %53 
                                              OpStore %189 %192 
                                 f32 %193 = OpLoad %177 
                                 f32 %194 = OpLoad %189 
                                 f32 %195 = OpFMul %193 %194 
                                 f32 %196 = OpFAdd %195 %58 
                                              OpStore %189 %196 
                                 f32 %197 = OpLoad %177 
                                 f32 %198 = OpLoad %189 
                                 f32 %199 = OpFMul %197 %198 
                                 f32 %200 = OpFAdd %199 %63 
                                              OpStore %189 %200 
                                 f32 %201 = OpLoad %177 
                                 f32 %202 = OpLoad %189 
                                 f32 %203 = OpFMul %201 %202 
                                 f32 %204 = OpFAdd %203 %68 
                                              OpStore %177 %204 
                                 f32 %205 = OpLoad %168 
                                 f32 %206 = OpLoad %177 
                                 f32 %207 = OpFMul %205 %206 
                                              OpStore %189 %207 
                                 f32 %208 = OpLoad %189 
                                 f32 %209 = OpFMul %208 %75 
                                 f32 %210 = OpFAdd %209 %77 
                                              OpStore %189 %210 
                                 f32 %212 = OpLoad %49 
                          Input f32* %213 = OpAccessChain vs_TEXCOORD1 %170 
                                 f32 %214 = OpLoad %213 
                                 f32 %215 = OpExtInst %1 4 %214 
                                bool %216 = OpFOrdLessThan %212 %215 
                                              OpStore %211 %216 
                                 f32 %217 = OpLoad %49 
                          Input f32* %218 = OpAccessChain vs_TEXCOORD1 %170 
                                 f32 %219 = OpLoad %218 
                                 f32 %220 = OpExtInst %1 37 %217 %219 
                                              OpStore %49 %220 
                                 f32 %221 = OpLoad %49 
                                 f32 %222 = OpLoad %49 
                                 f32 %223 = OpFNegate %222 
                                bool %224 = OpFOrdLessThan %221 %223 
                                              OpStore %129 %224 
                                bool %225 = OpLoad %211 
                                 f32 %226 = OpLoad %189 
                                 f32 %227 = OpSelect %225 %226 %91 
                                              OpStore %189 %227 
                                 f32 %228 = OpLoad %168 
                                 f32 %229 = OpLoad %177 
                                 f32 %230 = OpFMul %228 %229 
                                 f32 %231 = OpLoad %189 
                                 f32 %232 = OpFAdd %230 %231 
                                              OpStore %168 %232 
                                bool %233 = OpLoad %129 
                                              OpSelectionMerge %236 None 
                                              OpBranchConditional %233 %235 %239 
                                     %235 = OpLabel 
                                 f32 %237 = OpLoad %168 
                                 f32 %238 = OpFNegate %237 
                                              OpStore %234 %238 
                                              OpBranch %236 
                                     %239 = OpLabel 
                                 f32 %240 = OpLoad %168 
                                              OpStore %234 %240 
                                              OpBranch %236 
                                     %236 = OpLabel 
                                 f32 %241 = OpLoad %234 
                                              OpStore %49 %241 
                                 f32 %242 = OpLoad %49 
                                 f32 %243 = OpFNegate %242 
                                 f32 %245 = OpFMul %243 %244 
                                 f32 %246 = OpFAdd %245 %26 
                        Private f32* %247 = OpAccessChain %9 %170 
                                              OpStore %247 %246 
                 read_only Texture2D %251 = OpLoad %250 
                             sampler %255 = OpLoad %254 
          read_only Texture2DSampled %257 = OpSampledImage %251 %255 
                               f32_3 %258 = OpLoad %9 
                               f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                               f32_4 %260 = OpImageSampleImplicitLod %257 %259 
                               f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                              OpStore %9 %261 
                          Input f32* %262 = OpAccessChain vs_TEXCOORD1 %170 
                                 f32 %263 = OpLoad %262 
                                bool %264 = OpFOrdGreaterThanEqual %91 %263 
                                              OpStore %81 %264 
                                bool %265 = OpLoad %81 
                                 f32 %266 = OpSelect %265 %26 %91 
                                              OpStore %168 %266 
                                 f32 %269 = OpLoad %168 
                               f32_4 %270 = OpCompositeConstruct %269 %269 %269 %269 
                               f32_3 %271 = OpLoad %9 
                               f32_4 %272 = OpVectorShuffle %271 %271 0 1 2 0 
                               f32_4 %273 = OpFMul %270 %272 
                                              OpStore %268 %273 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, abs(vs_TEXCOORD1.z));
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318310142;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat4 = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = (-u_xlat4) * -0.636620283 + 1.0;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = 0.0>=vs_TEXCOORD1.y;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 259
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %252 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %234 DescriptorSet 234 
                                              OpDecorate %234 Binding 234 
                                              OpDecorate %238 DescriptorSet 238 
                                              OpDecorate %238 Binding 238 
                                              OpDecorate %252 Location 252 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                                     %126 = OpTypePointer Function %6 
                                 f32 %140 = OpConstant 3.674022E-40 
                                     %143 = OpTypeVector %6 2 
                        Private f32* %151 = OpVariable Private 
                                 u32 %153 = OpConstant 1 
                        Private f32* %160 = OpVariable Private 
                        Private f32* %172 = OpVariable Private 
                       Private bool* %194 = OpVariable Private 
                       Private bool* %204 = OpVariable Private 
                                 f32 %228 = OpConstant 3.674022E-40 
                                     %232 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %233 = OpTypePointer UniformConstant %232 
UniformConstant read_only Texture2D* %234 = OpVariable UniformConstant 
                                     %236 = OpTypeSampler 
                                     %237 = OpTypePointer UniformConstant %236 
            UniformConstant sampler* %238 = OpVariable UniformConstant 
                                     %240 = OpTypeSampledImage %232 
                                     %251 = OpTypePointer Output %10 
                       Output f32_4* %252 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %127 = OpVariable Function 
                       Function f32* %218 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 4 %118 
                                 f32 %120 = OpExtInst %1 37 %116 %119 
                                              OpStore %31 %120 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpLoad %31 
                                 f32 %123 = OpFNegate %122 
                                bool %124 = OpFOrdLessThan %121 %123 
                                              OpStore %100 %124 
                                bool %125 = OpLoad %100 
                                              OpSelectionMerge %129 None 
                                              OpBranchConditional %125 %128 %133 
                                     %128 = OpLabel 
                        Private f32* %130 = OpAccessChain %9 %14 
                                 f32 %131 = OpLoad %130 
                                 f32 %132 = OpFNegate %131 
                                              OpStore %127 %132 
                                              OpBranch %129 
                                     %133 = OpLabel 
                        Private f32* %134 = OpAccessChain %9 %14 
                                 f32 %135 = OpLoad %134 
                                              OpStore %127 %135 
                                              OpBranch %129 
                                     %129 = OpLabel 
                                 f32 %136 = OpLoad %127 
                        Private f32* %137 = OpAccessChain %9 %14 
                                              OpStore %137 %136 
                        Private f32* %138 = OpAccessChain %9 %14 
                                 f32 %139 = OpLoad %138 
                                 f32 %141 = OpFMul %139 %140 
                        Private f32* %142 = OpAccessChain %9 %14 
                                              OpStore %142 %141 
                               f32_4 %144 = OpLoad vs_TEXCOORD1 
                               f32_2 %145 = OpVectorShuffle %144 %144 0 2 
                               f32_4 %146 = OpLoad vs_TEXCOORD1 
                               f32_2 %147 = OpVectorShuffle %146 %146 0 2 
                                 f32 %148 = OpDot %145 %147 
                                              OpStore %49 %148 
                                 f32 %149 = OpLoad %49 
                                 f32 %150 = OpExtInst %1 31 %149 
                                              OpStore %49 %150 
                                 f32 %152 = OpLoad %49 
                          Input f32* %154 = OpAccessChain vs_TEXCOORD1 %153 
                                 f32 %155 = OpLoad %154 
                                 f32 %156 = OpExtInst %1 4 %155 
                                 f32 %157 = OpExtInst %1 40 %152 %156 
                                              OpStore %151 %157 
                                 f32 %158 = OpLoad %151 
                                 f32 %159 = OpFDiv %26 %158 
                                              OpStore %151 %159 
                                 f32 %161 = OpLoad %49 
                          Input f32* %162 = OpAccessChain vs_TEXCOORD1 %153 
                                 f32 %163 = OpLoad %162 
                                 f32 %164 = OpExtInst %1 4 %163 
                                 f32 %165 = OpExtInst %1 37 %161 %164 
                                              OpStore %160 %165 
                                 f32 %166 = OpLoad %151 
                                 f32 %167 = OpLoad %160 
                                 f32 %168 = OpFMul %166 %167 
                                              OpStore %151 %168 
                                 f32 %169 = OpLoad %151 
                                 f32 %170 = OpLoad %151 
                                 f32 %171 = OpFMul %169 %170 
                                              OpStore %160 %171 
                                 f32 %173 = OpLoad %160 
                                 f32 %174 = OpFMul %173 %51 
                                 f32 %175 = OpFAdd %174 %53 
                                              OpStore %172 %175 
                                 f32 %176 = OpLoad %160 
                                 f32 %177 = OpLoad %172 
                                 f32 %178 = OpFMul %176 %177 
                                 f32 %179 = OpFAdd %178 %58 
                                              OpStore %172 %179 
                                 f32 %180 = OpLoad %160 
                                 f32 %181 = OpLoad %172 
                                 f32 %182 = OpFMul %180 %181 
                                 f32 %183 = OpFAdd %182 %63 
                                              OpStore %172 %183 
                                 f32 %184 = OpLoad %160 
                                 f32 %185 = OpLoad %172 
                                 f32 %186 = OpFMul %184 %185 
                                 f32 %187 = OpFAdd %186 %68 
                                              OpStore %160 %187 
                                 f32 %188 = OpLoad %151 
                                 f32 %189 = OpLoad %160 
                                 f32 %190 = OpFMul %188 %189 
                                              OpStore %172 %190 
                                 f32 %191 = OpLoad %172 
                                 f32 %192 = OpFMul %191 %75 
                                 f32 %193 = OpFAdd %192 %77 
                                              OpStore %172 %193 
                                 f32 %195 = OpLoad %49 
                          Input f32* %196 = OpAccessChain vs_TEXCOORD1 %153 
                                 f32 %197 = OpLoad %196 
                                 f32 %198 = OpExtInst %1 4 %197 
                                bool %199 = OpFOrdLessThan %195 %198 
                                              OpStore %194 %199 
                                 f32 %200 = OpLoad %49 
                          Input f32* %201 = OpAccessChain vs_TEXCOORD1 %153 
                                 f32 %202 = OpLoad %201 
                                 f32 %203 = OpExtInst %1 37 %200 %202 
                                              OpStore %49 %203 
                                 f32 %205 = OpLoad %49 
                                 f32 %206 = OpLoad %49 
                                 f32 %207 = OpFNegate %206 
                                bool %208 = OpFOrdLessThan %205 %207 
                                              OpStore %204 %208 
                                bool %209 = OpLoad %194 
                                 f32 %210 = OpLoad %172 
                                 f32 %211 = OpSelect %209 %210 %91 
                                              OpStore %172 %211 
                                 f32 %212 = OpLoad %151 
                                 f32 %213 = OpLoad %160 
                                 f32 %214 = OpFMul %212 %213 
                                 f32 %215 = OpLoad %172 
                                 f32 %216 = OpFAdd %214 %215 
                                              OpStore %151 %216 
                                bool %217 = OpLoad %204 
                                              OpSelectionMerge %220 None 
                                              OpBranchConditional %217 %219 %223 
                                     %219 = OpLabel 
                                 f32 %221 = OpLoad %151 
                                 f32 %222 = OpFNegate %221 
                                              OpStore %218 %222 
                                              OpBranch %220 
                                     %223 = OpLabel 
                                 f32 %224 = OpLoad %151 
                                              OpStore %218 %224 
                                              OpBranch %220 
                                     %220 = OpLabel 
                                 f32 %225 = OpLoad %218 
                                              OpStore %49 %225 
                                 f32 %226 = OpLoad %49 
                                 f32 %227 = OpFNegate %226 
                                 f32 %229 = OpFMul %227 %228 
                                 f32 %230 = OpFAdd %229 %26 
                        Private f32* %231 = OpAccessChain %9 %153 
                                              OpStore %231 %230 
                 read_only Texture2D %235 = OpLoad %234 
                             sampler %239 = OpLoad %238 
          read_only Texture2DSampled %241 = OpSampledImage %235 %239 
                               f32_3 %242 = OpLoad %9 
                               f32_2 %243 = OpVectorShuffle %242 %242 0 1 
                               f32_4 %244 = OpImageSampleImplicitLod %241 %243 
                               f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                              OpStore %9 %245 
                          Input f32* %246 = OpAccessChain vs_TEXCOORD1 %153 
                                 f32 %247 = OpLoad %246 
                                bool %248 = OpFOrdGreaterThanEqual %91 %247 
                                              OpStore %81 %248 
                                bool %249 = OpLoad %81 
                                 f32 %250 = OpSelect %249 %26 %91 
                                              OpStore %151 %250 
                                 f32 %253 = OpLoad %151 
                               f32_4 %254 = OpCompositeConstruct %253 %253 %253 %253 
                               f32_3 %255 = OpLoad %9 
                               f32_4 %256 = OpVectorShuffle %255 %255 0 1 2 0 
                               f32_4 %257 = OpFMul %254 %256 
                                              OpStore %252 %257 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2 = max(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat4 = min(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat4 = u_xlat2 * u_xlat2;
    u_xlat6 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat4 * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat4 * u_xlat6 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat4 * u_xlat2;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
    u_xlatb1 = u_xlat0.x<abs(vs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, vs_TEXCOORD1.y);
    u_xlatb0 = u_xlat0.x<(-u_xlat0.x);
    u_xlat6 = u_xlatb1 ? u_xlat6 : float(0.0);
    u_xlat2 = u_xlat2 * u_xlat4 + u_xlat6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat2) : u_xlat2;
    u_xlat0.y = (-u_xlat0.x) * -0.636620283 + 1.0;
    u_xlat4 = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1 = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat6 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat6 * u_xlat1 + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat6 * u_xlat4;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb3 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat1 = u_xlatb3 ? u_xlat1 : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1;
    u_xlat0.x = u_xlat4 * 0.636620283;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = 0.0>=vs_TEXCOORD1.y;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 223
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %216 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %197 DescriptorSet 197 
                                              OpDecorate %197 Binding 197 
                                              OpDecorate %201 DescriptorSet 201 
                                              OpDecorate %201 Binding 201 
                                              OpDecorate %216 Location 216 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeVector %6 2 
                                      %19 = OpTypeInt 32 0 
                                  u32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Private %6 
                         Private f32* %27 = OpVariable Private 
                                  u32 %30 = OpConstant 1 
                                      %31 = OpTypePointer Input %6 
                                  f32 %36 = OpConstant 3.674022E-40 
                         Private f32* %39 = OpVariable Private 
                         Private f32* %52 = OpVariable Private 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                  f32 %61 = OpConstant 3.674022E-40 
                                  f32 %66 = OpConstant 3.674022E-40 
                                  f32 %71 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                  f32 %79 = OpConstant 3.674022E-40 
                                      %81 = OpTypeBool 
                                      %82 = OpTypePointer Private %81 
                        Private bool* %83 = OpVariable Private 
                        Private bool* %96 = OpVariable Private 
                                 f32 %105 = OpConstant 3.674022E-40 
                                     %113 = OpTypePointer Function %6 
                                 f32 %126 = OpConstant 3.674022E-40 
                                 u32 %133 = OpConstant 2 
                        Private f32* %153 = OpVariable Private 
                       Private bool* %175 = OpVariable Private 
                                 f32 %192 = OpConstant 3.674022E-40 
                                     %195 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %196 = OpTypePointer UniformConstant %195 
UniformConstant read_only Texture2D* %197 = OpVariable UniformConstant 
                                     %199 = OpTypeSampler 
                                     %200 = OpTypePointer UniformConstant %199 
            UniformConstant sampler* %201 = OpVariable UniformConstant 
                                     %203 = OpTypeSampledImage %195 
                       Private bool* %209 = OpVariable Private 
                                     %215 = OpTypePointer Output %10 
                       Output f32_4* %216 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %114 = OpVariable Function 
                                f32_4 %14 = OpLoad vs_TEXCOORD1 
                                f32_2 %15 = OpVectorShuffle %14 %14 0 2 
                                f32_4 %16 = OpLoad vs_TEXCOORD1 
                                f32_2 %17 = OpVectorShuffle %16 %16 0 2 
                                  f32 %18 = OpDot %15 %17 
                         Private f32* %22 = OpAccessChain %9 %20 
                                              OpStore %22 %18 
                         Private f32* %23 = OpAccessChain %9 %20 
                                  f32 %24 = OpLoad %23 
                                  f32 %25 = OpExtInst %1 31 %24 
                         Private f32* %26 = OpAccessChain %9 %20 
                                              OpStore %26 %25 
                         Private f32* %28 = OpAccessChain %9 %20 
                                  f32 %29 = OpLoad %28 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                                  f32 %35 = OpExtInst %1 40 %29 %34 
                                              OpStore %27 %35 
                                  f32 %37 = OpLoad %27 
                                  f32 %38 = OpFDiv %36 %37 
                                              OpStore %27 %38 
                         Private f32* %40 = OpAccessChain %9 %20 
                                  f32 %41 = OpLoad %40 
                           Input f32* %42 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %43 = OpLoad %42 
                                  f32 %44 = OpExtInst %1 4 %43 
                                  f32 %45 = OpExtInst %1 37 %41 %44 
                                              OpStore %39 %45 
                                  f32 %46 = OpLoad %27 
                                  f32 %47 = OpLoad %39 
                                  f32 %48 = OpFMul %46 %47 
                                              OpStore %27 %48 
                                  f32 %49 = OpLoad %27 
                                  f32 %50 = OpLoad %27 
                                  f32 %51 = OpFMul %49 %50 
                                              OpStore %39 %51 
                                  f32 %53 = OpLoad %39 
                                  f32 %55 = OpFMul %53 %54 
                                  f32 %57 = OpFAdd %55 %56 
                                              OpStore %52 %57 
                                  f32 %58 = OpLoad %39 
                                  f32 %59 = OpLoad %52 
                                  f32 %60 = OpFMul %58 %59 
                                  f32 %62 = OpFAdd %60 %61 
                                              OpStore %52 %62 
                                  f32 %63 = OpLoad %39 
                                  f32 %64 = OpLoad %52 
                                  f32 %65 = OpFMul %63 %64 
                                  f32 %67 = OpFAdd %65 %66 
                                              OpStore %52 %67 
                                  f32 %68 = OpLoad %39 
                                  f32 %69 = OpLoad %52 
                                  f32 %70 = OpFMul %68 %69 
                                  f32 %72 = OpFAdd %70 %71 
                                              OpStore %39 %72 
                                  f32 %73 = OpLoad %39 
                                  f32 %74 = OpLoad %27 
                                  f32 %75 = OpFMul %73 %74 
                                              OpStore %52 %75 
                                  f32 %76 = OpLoad %52 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %80 = OpFAdd %78 %79 
                                              OpStore %52 %80 
                         Private f32* %84 = OpAccessChain %9 %20 
                                  f32 %85 = OpLoad %84 
                           Input f32* %86 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpExtInst %1 4 %87 
                                 bool %89 = OpFOrdLessThan %85 %88 
                                              OpStore %83 %89 
                         Private f32* %90 = OpAccessChain %9 %20 
                                  f32 %91 = OpLoad %90 
                           Input f32* %92 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpExtInst %1 37 %91 %93 
                         Private f32* %95 = OpAccessChain %9 %20 
                                              OpStore %95 %94 
                         Private f32* %97 = OpAccessChain %9 %20 
                                  f32 %98 = OpLoad %97 
                         Private f32* %99 = OpAccessChain %9 %20 
                                 f32 %100 = OpLoad %99 
                                 f32 %101 = OpFNegate %100 
                                bool %102 = OpFOrdLessThan %98 %101 
                                              OpStore %96 %102 
                                bool %103 = OpLoad %83 
                                 f32 %104 = OpLoad %52 
                                 f32 %106 = OpSelect %103 %104 %105 
                                              OpStore %52 %106 
                                 f32 %107 = OpLoad %27 
                                 f32 %108 = OpLoad %39 
                                 f32 %109 = OpFMul %107 %108 
                                 f32 %110 = OpLoad %52 
                                 f32 %111 = OpFAdd %109 %110 
                                              OpStore %27 %111 
                                bool %112 = OpLoad %96 
                                              OpSelectionMerge %116 None 
                                              OpBranchConditional %112 %115 %119 
                                     %115 = OpLabel 
                                 f32 %117 = OpLoad %27 
                                 f32 %118 = OpFNegate %117 
                                              OpStore %114 %118 
                                              OpBranch %116 
                                     %119 = OpLabel 
                                 f32 %120 = OpLoad %27 
                                              OpStore %114 %120 
                                              OpBranch %116 
                                     %116 = OpLabel 
                                 f32 %121 = OpLoad %114 
                        Private f32* %122 = OpAccessChain %9 %20 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %9 %20 
                                 f32 %124 = OpLoad %123 
                                 f32 %125 = OpFNegate %124 
                                 f32 %127 = OpFMul %125 %126 
                                 f32 %128 = OpFAdd %127 %36 
                        Private f32* %129 = OpAccessChain %9 %30 
                                              OpStore %129 %128 
                          Input f32* %130 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %131 = OpLoad %130 
                                 f32 %132 = OpExtInst %1 4 %131 
                          Input f32* %134 = OpAccessChain vs_TEXCOORD1 %133 
                                 f32 %135 = OpLoad %134 
                                 f32 %136 = OpExtInst %1 4 %135 
                                 f32 %137 = OpExtInst %1 40 %132 %136 
                                              OpStore %39 %137 
                                 f32 %138 = OpLoad %39 
                                 f32 %139 = OpFDiv %36 %138 
                                              OpStore %39 %139 
                          Input f32* %140 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %141 = OpLoad %140 
                                 f32 %142 = OpExtInst %1 4 %141 
                          Input f32* %143 = OpAccessChain vs_TEXCOORD1 %133 
                                 f32 %144 = OpLoad %143 
                                 f32 %145 = OpExtInst %1 4 %144 
                                 f32 %146 = OpExtInst %1 37 %142 %145 
                                              OpStore %52 %146 
                                 f32 %147 = OpLoad %39 
                                 f32 %148 = OpLoad %52 
                                 f32 %149 = OpFMul %147 %148 
                                              OpStore %39 %149 
                                 f32 %150 = OpLoad %39 
                                 f32 %151 = OpLoad %39 
                                 f32 %152 = OpFMul %150 %151 
                                              OpStore %52 %152 
                                 f32 %154 = OpLoad %52 
                                 f32 %155 = OpFMul %154 %54 
                                 f32 %156 = OpFAdd %155 %56 
                                              OpStore %153 %156 
                                 f32 %157 = OpLoad %52 
                                 f32 %158 = OpLoad %153 
                                 f32 %159 = OpFMul %157 %158 
                                 f32 %160 = OpFAdd %159 %61 
                                              OpStore %153 %160 
                                 f32 %161 = OpLoad %52 
                                 f32 %162 = OpLoad %153 
                                 f32 %163 = OpFMul %161 %162 
                                 f32 %164 = OpFAdd %163 %66 
                                              OpStore %153 %164 
                                 f32 %165 = OpLoad %52 
                                 f32 %166 = OpLoad %153 
                                 f32 %167 = OpFMul %165 %166 
                                 f32 %168 = OpFAdd %167 %71 
                                              OpStore %52 %168 
                                 f32 %169 = OpLoad %52 
                                 f32 %170 = OpLoad %39 
                                 f32 %171 = OpFMul %169 %170 
                                              OpStore %153 %171 
                                 f32 %172 = OpLoad %153 
                                 f32 %173 = OpFMul %172 %77 
                                 f32 %174 = OpFAdd %173 %79 
                                              OpStore %153 %174 
                          Input f32* %176 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpExtInst %1 4 %177 
                          Input f32* %179 = OpAccessChain vs_TEXCOORD1 %133 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpExtInst %1 4 %180 
                                bool %182 = OpFOrdLessThan %178 %181 
                                              OpStore %175 %182 
                                bool %183 = OpLoad %175 
                                 f32 %184 = OpLoad %153 
                                 f32 %185 = OpSelect %183 %184 %105 
                                              OpStore %153 %185 
                                 f32 %186 = OpLoad %39 
                                 f32 %187 = OpLoad %52 
                                 f32 %188 = OpFMul %186 %187 
                                 f32 %189 = OpLoad %153 
                                 f32 %190 = OpFAdd %188 %189 
                                              OpStore %39 %190 
                                 f32 %191 = OpLoad %39 
                                 f32 %193 = OpFMul %191 %192 
                        Private f32* %194 = OpAccessChain %9 %20 
                                              OpStore %194 %193 
                 read_only Texture2D %198 = OpLoad %197 
                             sampler %202 = OpLoad %201 
          read_only Texture2DSampled %204 = OpSampledImage %198 %202 
                               f32_3 %205 = OpLoad %9 
                               f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                               f32_4 %207 = OpImageSampleImplicitLod %204 %206 
                               f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                              OpStore %9 %208 
                          Input f32* %210 = OpAccessChain vs_TEXCOORD1 %30 
                                 f32 %211 = OpLoad %210 
                                bool %212 = OpFOrdGreaterThanEqual %105 %211 
                                              OpStore %209 %212 
                                bool %213 = OpLoad %209 
                                 f32 %214 = OpSelect %213 %36 %105 
                                              OpStore %52 %214 
                                 f32 %217 = OpLoad %52 
                               f32_4 %218 = OpCompositeConstruct %217 %217 %217 %217 
                               f32_3 %219 = OpLoad %9 
                               f32_4 %220 = OpVectorShuffle %219 %219 0 1 2 0 
                               f32_4 %221 = OpFMul %218 %220 
                                              OpStore %216 %221 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat4 = max(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb2 = u_xlatb4 && u_xlatb2;
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 3.14159012;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat0.z = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.xy = u_xlat0.xz * vec2(0.159155071, 0.636620283);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = vs_TEXCOORD1.y>=0.0;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 273
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %266 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %248 DescriptorSet 248 
                                              OpDecorate %248 Binding 248 
                                              OpDecorate %252 DescriptorSet 252 
                                              OpDecorate %252 Binding 252 
                                              OpDecorate %266 Location 266 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                       Private bool* %129 = OpVariable Private 
                                     %138 = OpTypePointer Function %6 
                                 f32 %152 = OpConstant 3.674022E-40 
                                     %155 = OpTypeVector %6 2 
                        Private f32* %163 = OpVariable Private 
                                 u32 %165 = OpConstant 1 
                        Private f32* %172 = OpVariable Private 
                        Private f32* %184 = OpVariable Private 
                       Private bool* %206 = OpVariable Private 
                                 f32 %240 = OpConstant 3.674022E-40 
                                 f32 %241 = OpConstant 3.674022E-40 
                               f32_2 %242 = OpConstantComposite %240 %241 
                                     %246 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %247 = OpTypePointer UniformConstant %246 
UniformConstant read_only Texture2D* %248 = OpVariable UniformConstant 
                                     %250 = OpTypeSampler 
                                     %251 = OpTypePointer UniformConstant %250 
            UniformConstant sampler* %252 = OpVariable UniformConstant 
                                     %254 = OpTypeSampledImage %246 
                                     %265 = OpTypePointer Output %10 
                       Output f32_4* %266 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %139 = OpVariable Function 
                       Function f32* %229 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 37 %116 %118 
                                              OpStore %31 %119 
                                 f32 %120 = OpLoad %31 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpFNegate %121 
                                bool %123 = OpFOrdLessThan %120 %122 
                                              OpStore %100 %123 
                          Input f32* %124 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %125 = OpLoad %124 
                          Input f32* %126 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %127 = OpLoad %126 
                                 f32 %128 = OpExtInst %1 40 %125 %127 
                                              OpStore %49 %128 
                                 f32 %130 = OpLoad %49 
                                 f32 %131 = OpLoad %49 
                                 f32 %132 = OpFNegate %131 
                                bool %133 = OpFOrdGreaterThanEqual %130 %132 
                                              OpStore %129 %133 
                                bool %134 = OpLoad %129 
                                bool %135 = OpLoad %100 
                                bool %136 = OpLogicalAnd %134 %135 
                                              OpStore %100 %136 
                                bool %137 = OpLoad %100 
                                              OpSelectionMerge %141 None 
                                              OpBranchConditional %137 %140 %145 
                                     %140 = OpLabel 
                        Private f32* %142 = OpAccessChain %9 %14 
                                 f32 %143 = OpLoad %142 
                                 f32 %144 = OpFNegate %143 
                                              OpStore %139 %144 
                                              OpBranch %141 
                                     %145 = OpLabel 
                        Private f32* %146 = OpAccessChain %9 %14 
                                 f32 %147 = OpLoad %146 
                                              OpStore %139 %147 
                                              OpBranch %141 
                                     %141 = OpLabel 
                                 f32 %148 = OpLoad %139 
                        Private f32* %149 = OpAccessChain %9 %14 
                                              OpStore %149 %148 
                        Private f32* %150 = OpAccessChain %9 %14 
                                 f32 %151 = OpLoad %150 
                                 f32 %153 = OpFAdd %151 %152 
                        Private f32* %154 = OpAccessChain %9 %14 
                                              OpStore %154 %153 
                               f32_4 %156 = OpLoad vs_TEXCOORD1 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 2 
                               f32_4 %158 = OpLoad vs_TEXCOORD1 
                               f32_2 %159 = OpVectorShuffle %158 %158 0 2 
                                 f32 %160 = OpDot %157 %159 
                                              OpStore %49 %160 
                                 f32 %161 = OpLoad %49 
                                 f32 %162 = OpExtInst %1 31 %161 
                                              OpStore %49 %162 
                                 f32 %164 = OpLoad %49 
                          Input f32* %166 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %167 = OpLoad %166 
                                 f32 %168 = OpExtInst %1 4 %167 
                                 f32 %169 = OpExtInst %1 40 %164 %168 
                                              OpStore %163 %169 
                                 f32 %170 = OpLoad %163 
                                 f32 %171 = OpFDiv %26 %170 
                                              OpStore %163 %171 
                                 f32 %173 = OpLoad %49 
                          Input f32* %174 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %175 = OpLoad %174 
                                 f32 %176 = OpExtInst %1 4 %175 
                                 f32 %177 = OpExtInst %1 37 %173 %176 
                                              OpStore %172 %177 
                                 f32 %178 = OpLoad %163 
                                 f32 %179 = OpLoad %172 
                                 f32 %180 = OpFMul %178 %179 
                                              OpStore %163 %180 
                                 f32 %181 = OpLoad %163 
                                 f32 %182 = OpLoad %163 
                                 f32 %183 = OpFMul %181 %182 
                                              OpStore %172 %183 
                                 f32 %185 = OpLoad %172 
                                 f32 %186 = OpFMul %185 %51 
                                 f32 %187 = OpFAdd %186 %53 
                                              OpStore %184 %187 
                                 f32 %188 = OpLoad %172 
                                 f32 %189 = OpLoad %184 
                                 f32 %190 = OpFMul %188 %189 
                                 f32 %191 = OpFAdd %190 %58 
                                              OpStore %184 %191 
                                 f32 %192 = OpLoad %172 
                                 f32 %193 = OpLoad %184 
                                 f32 %194 = OpFMul %192 %193 
                                 f32 %195 = OpFAdd %194 %63 
                                              OpStore %184 %195 
                                 f32 %196 = OpLoad %172 
                                 f32 %197 = OpLoad %184 
                                 f32 %198 = OpFMul %196 %197 
                                 f32 %199 = OpFAdd %198 %68 
                                              OpStore %172 %199 
                                 f32 %200 = OpLoad %163 
                                 f32 %201 = OpLoad %172 
                                 f32 %202 = OpFMul %200 %201 
                                              OpStore %184 %202 
                                 f32 %203 = OpLoad %184 
                                 f32 %204 = OpFMul %203 %75 
                                 f32 %205 = OpFAdd %204 %77 
                                              OpStore %184 %205 
                                 f32 %207 = OpLoad %49 
                          Input f32* %208 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %209 = OpLoad %208 
                                 f32 %210 = OpExtInst %1 4 %209 
                                bool %211 = OpFOrdLessThan %207 %210 
                                              OpStore %206 %211 
                                 f32 %212 = OpLoad %49 
                          Input f32* %213 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %214 = OpLoad %213 
                                 f32 %215 = OpExtInst %1 37 %212 %214 
                                              OpStore %49 %215 
                                 f32 %216 = OpLoad %49 
                                 f32 %217 = OpLoad %49 
                                 f32 %218 = OpFNegate %217 
                                bool %219 = OpFOrdLessThan %216 %218 
                                              OpStore %129 %219 
                                bool %220 = OpLoad %206 
                                 f32 %221 = OpLoad %184 
                                 f32 %222 = OpSelect %220 %221 %91 
                                              OpStore %184 %222 
                                 f32 %223 = OpLoad %163 
                                 f32 %224 = OpLoad %172 
                                 f32 %225 = OpFMul %223 %224 
                                 f32 %226 = OpLoad %184 
                                 f32 %227 = OpFAdd %225 %226 
                                              OpStore %163 %227 
                                bool %228 = OpLoad %129 
                                              OpSelectionMerge %231 None 
                                              OpBranchConditional %228 %230 %234 
                                     %230 = OpLabel 
                                 f32 %232 = OpLoad %163 
                                 f32 %233 = OpFNegate %232 
                                              OpStore %229 %233 
                                              OpBranch %231 
                                     %234 = OpLabel 
                                 f32 %235 = OpLoad %163 
                                              OpStore %229 %235 
                                              OpBranch %231 
                                     %231 = OpLabel 
                                 f32 %236 = OpLoad %229 
                        Private f32* %237 = OpAccessChain %9 %19 
                                              OpStore %237 %236 
                               f32_3 %238 = OpLoad %9 
                               f32_2 %239 = OpVectorShuffle %238 %238 0 2 
                               f32_2 %243 = OpFMul %239 %242 
                               f32_3 %244 = OpLoad %9 
                               f32_3 %245 = OpVectorShuffle %244 %243 3 4 2 
                                              OpStore %9 %245 
                 read_only Texture2D %249 = OpLoad %248 
                             sampler %253 = OpLoad %252 
          read_only Texture2DSampled %255 = OpSampledImage %249 %253 
                               f32_3 %256 = OpLoad %9 
                               f32_2 %257 = OpVectorShuffle %256 %256 0 1 
                               f32_4 %258 = OpImageSampleImplicitLod %255 %257 
                               f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                              OpStore %9 %259 
                          Input f32* %260 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %261 = OpLoad %260 
                                bool %262 = OpFOrdGreaterThanEqual %261 %91 
                                              OpStore %81 %262 
                                bool %263 = OpLoad %81 
                                 f32 %264 = OpSelect %263 %26 %91 
                                              OpStore %163 %264 
                                 f32 %267 = OpLoad %163 
                               f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
                               f32_3 %269 = OpLoad %9 
                               f32_4 %270 = OpVectorShuffle %269 %269 0 1 2 0 
                               f32_4 %271 = OpFMul %268 %270 
                                              OpStore %266 %271 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, abs(vs_TEXCOORD1.z));
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat0.z = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.xy = u_xlat0.xz * vec2(0.318310142, 0.636620283);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = vs_TEXCOORD1.y>=0.0;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 257
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %250 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %232 DescriptorSet 232 
                                              OpDecorate %232 Binding 232 
                                              OpDecorate %236 DescriptorSet 236 
                                              OpDecorate %236 Binding 236 
                                              OpDecorate %250 Location 250 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                                     %126 = OpTypePointer Function %6 
                                     %138 = OpTypeVector %6 2 
                        Private f32* %146 = OpVariable Private 
                                 u32 %148 = OpConstant 1 
                        Private f32* %155 = OpVariable Private 
                        Private f32* %167 = OpVariable Private 
                       Private bool* %189 = OpVariable Private 
                       Private bool* %199 = OpVariable Private 
                                 f32 %224 = OpConstant 3.674022E-40 
                                 f32 %225 = OpConstant 3.674022E-40 
                               f32_2 %226 = OpConstantComposite %224 %225 
                                     %230 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %231 = OpTypePointer UniformConstant %230 
UniformConstant read_only Texture2D* %232 = OpVariable UniformConstant 
                                     %234 = OpTypeSampler 
                                     %235 = OpTypePointer UniformConstant %234 
            UniformConstant sampler* %236 = OpVariable UniformConstant 
                                     %238 = OpTypeSampledImage %230 
                                     %249 = OpTypePointer Output %10 
                       Output f32_4* %250 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %127 = OpVariable Function 
                       Function f32* %213 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 4 %118 
                                 f32 %120 = OpExtInst %1 37 %116 %119 
                                              OpStore %31 %120 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpLoad %31 
                                 f32 %123 = OpFNegate %122 
                                bool %124 = OpFOrdLessThan %121 %123 
                                              OpStore %100 %124 
                                bool %125 = OpLoad %100 
                                              OpSelectionMerge %129 None 
                                              OpBranchConditional %125 %128 %133 
                                     %128 = OpLabel 
                        Private f32* %130 = OpAccessChain %9 %14 
                                 f32 %131 = OpLoad %130 
                                 f32 %132 = OpFNegate %131 
                                              OpStore %127 %132 
                                              OpBranch %129 
                                     %133 = OpLabel 
                        Private f32* %134 = OpAccessChain %9 %14 
                                 f32 %135 = OpLoad %134 
                                              OpStore %127 %135 
                                              OpBranch %129 
                                     %129 = OpLabel 
                                 f32 %136 = OpLoad %127 
                        Private f32* %137 = OpAccessChain %9 %14 
                                              OpStore %137 %136 
                               f32_4 %139 = OpLoad vs_TEXCOORD1 
                               f32_2 %140 = OpVectorShuffle %139 %139 0 2 
                               f32_4 %141 = OpLoad vs_TEXCOORD1 
                               f32_2 %142 = OpVectorShuffle %141 %141 0 2 
                                 f32 %143 = OpDot %140 %142 
                                              OpStore %49 %143 
                                 f32 %144 = OpLoad %49 
                                 f32 %145 = OpExtInst %1 31 %144 
                                              OpStore %49 %145 
                                 f32 %147 = OpLoad %49 
                          Input f32* %149 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %150 = OpLoad %149 
                                 f32 %151 = OpExtInst %1 4 %150 
                                 f32 %152 = OpExtInst %1 40 %147 %151 
                                              OpStore %146 %152 
                                 f32 %153 = OpLoad %146 
                                 f32 %154 = OpFDiv %26 %153 
                                              OpStore %146 %154 
                                 f32 %156 = OpLoad %49 
                          Input f32* %157 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %158 = OpLoad %157 
                                 f32 %159 = OpExtInst %1 4 %158 
                                 f32 %160 = OpExtInst %1 37 %156 %159 
                                              OpStore %155 %160 
                                 f32 %161 = OpLoad %146 
                                 f32 %162 = OpLoad %155 
                                 f32 %163 = OpFMul %161 %162 
                                              OpStore %146 %163 
                                 f32 %164 = OpLoad %146 
                                 f32 %165 = OpLoad %146 
                                 f32 %166 = OpFMul %164 %165 
                                              OpStore %155 %166 
                                 f32 %168 = OpLoad %155 
                                 f32 %169 = OpFMul %168 %51 
                                 f32 %170 = OpFAdd %169 %53 
                                              OpStore %167 %170 
                                 f32 %171 = OpLoad %155 
                                 f32 %172 = OpLoad %167 
                                 f32 %173 = OpFMul %171 %172 
                                 f32 %174 = OpFAdd %173 %58 
                                              OpStore %167 %174 
                                 f32 %175 = OpLoad %155 
                                 f32 %176 = OpLoad %167 
                                 f32 %177 = OpFMul %175 %176 
                                 f32 %178 = OpFAdd %177 %63 
                                              OpStore %167 %178 
                                 f32 %179 = OpLoad %155 
                                 f32 %180 = OpLoad %167 
                                 f32 %181 = OpFMul %179 %180 
                                 f32 %182 = OpFAdd %181 %68 
                                              OpStore %155 %182 
                                 f32 %183 = OpLoad %146 
                                 f32 %184 = OpLoad %155 
                                 f32 %185 = OpFMul %183 %184 
                                              OpStore %167 %185 
                                 f32 %186 = OpLoad %167 
                                 f32 %187 = OpFMul %186 %75 
                                 f32 %188 = OpFAdd %187 %77 
                                              OpStore %167 %188 
                                 f32 %190 = OpLoad %49 
                          Input f32* %191 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %192 = OpLoad %191 
                                 f32 %193 = OpExtInst %1 4 %192 
                                bool %194 = OpFOrdLessThan %190 %193 
                                              OpStore %189 %194 
                                 f32 %195 = OpLoad %49 
                          Input f32* %196 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %197 = OpLoad %196 
                                 f32 %198 = OpExtInst %1 37 %195 %197 
                                              OpStore %49 %198 
                                 f32 %200 = OpLoad %49 
                                 f32 %201 = OpLoad %49 
                                 f32 %202 = OpFNegate %201 
                                bool %203 = OpFOrdLessThan %200 %202 
                                              OpStore %199 %203 
                                bool %204 = OpLoad %189 
                                 f32 %205 = OpLoad %167 
                                 f32 %206 = OpSelect %204 %205 %91 
                                              OpStore %167 %206 
                                 f32 %207 = OpLoad %146 
                                 f32 %208 = OpLoad %155 
                                 f32 %209 = OpFMul %207 %208 
                                 f32 %210 = OpLoad %167 
                                 f32 %211 = OpFAdd %209 %210 
                                              OpStore %146 %211 
                                bool %212 = OpLoad %199 
                                              OpSelectionMerge %215 None 
                                              OpBranchConditional %212 %214 %218 
                                     %214 = OpLabel 
                                 f32 %216 = OpLoad %146 
                                 f32 %217 = OpFNegate %216 
                                              OpStore %213 %217 
                                              OpBranch %215 
                                     %218 = OpLabel 
                                 f32 %219 = OpLoad %146 
                                              OpStore %213 %219 
                                              OpBranch %215 
                                     %215 = OpLabel 
                                 f32 %220 = OpLoad %213 
                        Private f32* %221 = OpAccessChain %9 %19 
                                              OpStore %221 %220 
                               f32_3 %222 = OpLoad %9 
                               f32_2 %223 = OpVectorShuffle %222 %222 0 2 
                               f32_2 %227 = OpFMul %223 %226 
                               f32_3 %228 = OpLoad %9 
                               f32_3 %229 = OpVectorShuffle %228 %227 3 4 2 
                                              OpStore %9 %229 
                 read_only Texture2D %233 = OpLoad %232 
                             sampler %237 = OpLoad %236 
          read_only Texture2DSampled %239 = OpSampledImage %233 %237 
                               f32_3 %240 = OpLoad %9 
                               f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                               f32_4 %242 = OpImageSampleImplicitLod %239 %241 
                               f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                              OpStore %9 %243 
                          Input f32* %244 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %245 = OpLoad %244 
                                bool %246 = OpFOrdGreaterThanEqual %245 %91 
                                              OpStore %81 %246 
                                bool %247 = OpLoad %81 
                                 f32 %248 = OpSelect %247 %26 %91 
                                              OpStore %146 %248 
                                 f32 %251 = OpLoad %146 
                               f32_4 %252 = OpCompositeConstruct %251 %251 %251 %251 
                               f32_3 %253 = OpLoad %9 
                               f32_4 %254 = OpVectorShuffle %253 %253 0 1 2 0 
                               f32_4 %255 = OpFMul %252 %254 
                                              OpStore %250 %255 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2 = max(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat4 = min(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat4 = u_xlat2 * u_xlat2;
    u_xlat6 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat4 * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat4 * u_xlat6 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat4 * u_xlat2;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
    u_xlatb1 = u_xlat0.x<abs(vs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, vs_TEXCOORD1.y);
    u_xlatb0 = u_xlat0.x<(-u_xlat0.x);
    u_xlat6 = u_xlatb1 ? u_xlat6 : float(0.0);
    u_xlat2 = u_xlat2 * u_xlat4 + u_xlat6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat2) : u_xlat2;
    u_xlat0.y = u_xlat0.x * 0.636620283;
    u_xlat4 = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1 = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat6 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat6 * u_xlat1 + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat6 * u_xlat4;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb3 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat1 = u_xlatb3 ? u_xlat1 : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1;
    u_xlat0.x = u_xlat4 * 0.636620283;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlatb6 = vs_TEXCOORD1.y>=0.0;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    SV_Target0 = vec4(u_xlat6) * u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 220
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %213 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %194 DescriptorSet 194 
                                              OpDecorate %194 Binding 194 
                                              OpDecorate %198 DescriptorSet 198 
                                              OpDecorate %198 Binding 198 
                                              OpDecorate %213 Location 213 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeVector %6 2 
                                      %19 = OpTypeInt 32 0 
                                  u32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Private %6 
                         Private f32* %27 = OpVariable Private 
                                  u32 %30 = OpConstant 1 
                                      %31 = OpTypePointer Input %6 
                                  f32 %36 = OpConstant 3.674022E-40 
                         Private f32* %39 = OpVariable Private 
                         Private f32* %52 = OpVariable Private 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                  f32 %61 = OpConstant 3.674022E-40 
                                  f32 %66 = OpConstant 3.674022E-40 
                                  f32 %71 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                  f32 %79 = OpConstant 3.674022E-40 
                                      %81 = OpTypeBool 
                                      %82 = OpTypePointer Private %81 
                        Private bool* %83 = OpVariable Private 
                        Private bool* %96 = OpVariable Private 
                                 f32 %105 = OpConstant 3.674022E-40 
                                     %113 = OpTypePointer Function %6 
                                 f32 %125 = OpConstant 3.674022E-40 
                                 u32 %131 = OpConstant 2 
                        Private f32* %151 = OpVariable Private 
                       Private bool* %173 = OpVariable Private 
                                     %192 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %193 = OpTypePointer UniformConstant %192 
UniformConstant read_only Texture2D* %194 = OpVariable UniformConstant 
                                     %196 = OpTypeSampler 
                                     %197 = OpTypePointer UniformConstant %196 
            UniformConstant sampler* %198 = OpVariable UniformConstant 
                                     %200 = OpTypeSampledImage %192 
                       Private bool* %206 = OpVariable Private 
                                     %212 = OpTypePointer Output %10 
                       Output f32_4* %213 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %114 = OpVariable Function 
                                f32_4 %14 = OpLoad vs_TEXCOORD1 
                                f32_2 %15 = OpVectorShuffle %14 %14 0 2 
                                f32_4 %16 = OpLoad vs_TEXCOORD1 
                                f32_2 %17 = OpVectorShuffle %16 %16 0 2 
                                  f32 %18 = OpDot %15 %17 
                         Private f32* %22 = OpAccessChain %9 %20 
                                              OpStore %22 %18 
                         Private f32* %23 = OpAccessChain %9 %20 
                                  f32 %24 = OpLoad %23 
                                  f32 %25 = OpExtInst %1 31 %24 
                         Private f32* %26 = OpAccessChain %9 %20 
                                              OpStore %26 %25 
                         Private f32* %28 = OpAccessChain %9 %20 
                                  f32 %29 = OpLoad %28 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                                  f32 %35 = OpExtInst %1 40 %29 %34 
                                              OpStore %27 %35 
                                  f32 %37 = OpLoad %27 
                                  f32 %38 = OpFDiv %36 %37 
                                              OpStore %27 %38 
                         Private f32* %40 = OpAccessChain %9 %20 
                                  f32 %41 = OpLoad %40 
                           Input f32* %42 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %43 = OpLoad %42 
                                  f32 %44 = OpExtInst %1 4 %43 
                                  f32 %45 = OpExtInst %1 37 %41 %44 
                                              OpStore %39 %45 
                                  f32 %46 = OpLoad %27 
                                  f32 %47 = OpLoad %39 
                                  f32 %48 = OpFMul %46 %47 
                                              OpStore %27 %48 
                                  f32 %49 = OpLoad %27 
                                  f32 %50 = OpLoad %27 
                                  f32 %51 = OpFMul %49 %50 
                                              OpStore %39 %51 
                                  f32 %53 = OpLoad %39 
                                  f32 %55 = OpFMul %53 %54 
                                  f32 %57 = OpFAdd %55 %56 
                                              OpStore %52 %57 
                                  f32 %58 = OpLoad %39 
                                  f32 %59 = OpLoad %52 
                                  f32 %60 = OpFMul %58 %59 
                                  f32 %62 = OpFAdd %60 %61 
                                              OpStore %52 %62 
                                  f32 %63 = OpLoad %39 
                                  f32 %64 = OpLoad %52 
                                  f32 %65 = OpFMul %63 %64 
                                  f32 %67 = OpFAdd %65 %66 
                                              OpStore %52 %67 
                                  f32 %68 = OpLoad %39 
                                  f32 %69 = OpLoad %52 
                                  f32 %70 = OpFMul %68 %69 
                                  f32 %72 = OpFAdd %70 %71 
                                              OpStore %39 %72 
                                  f32 %73 = OpLoad %39 
                                  f32 %74 = OpLoad %27 
                                  f32 %75 = OpFMul %73 %74 
                                              OpStore %52 %75 
                                  f32 %76 = OpLoad %52 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %80 = OpFAdd %78 %79 
                                              OpStore %52 %80 
                         Private f32* %84 = OpAccessChain %9 %20 
                                  f32 %85 = OpLoad %84 
                           Input f32* %86 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpExtInst %1 4 %87 
                                 bool %89 = OpFOrdLessThan %85 %88 
                                              OpStore %83 %89 
                         Private f32* %90 = OpAccessChain %9 %20 
                                  f32 %91 = OpLoad %90 
                           Input f32* %92 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpExtInst %1 37 %91 %93 
                         Private f32* %95 = OpAccessChain %9 %20 
                                              OpStore %95 %94 
                         Private f32* %97 = OpAccessChain %9 %20 
                                  f32 %98 = OpLoad %97 
                         Private f32* %99 = OpAccessChain %9 %20 
                                 f32 %100 = OpLoad %99 
                                 f32 %101 = OpFNegate %100 
                                bool %102 = OpFOrdLessThan %98 %101 
                                              OpStore %96 %102 
                                bool %103 = OpLoad %83 
                                 f32 %104 = OpLoad %52 
                                 f32 %106 = OpSelect %103 %104 %105 
                                              OpStore %52 %106 
                                 f32 %107 = OpLoad %27 
                                 f32 %108 = OpLoad %39 
                                 f32 %109 = OpFMul %107 %108 
                                 f32 %110 = OpLoad %52 
                                 f32 %111 = OpFAdd %109 %110 
                                              OpStore %27 %111 
                                bool %112 = OpLoad %96 
                                              OpSelectionMerge %116 None 
                                              OpBranchConditional %112 %115 %119 
                                     %115 = OpLabel 
                                 f32 %117 = OpLoad %27 
                                 f32 %118 = OpFNegate %117 
                                              OpStore %114 %118 
                                              OpBranch %116 
                                     %119 = OpLabel 
                                 f32 %120 = OpLoad %27 
                                              OpStore %114 %120 
                                              OpBranch %116 
                                     %116 = OpLabel 
                                 f32 %121 = OpLoad %114 
                        Private f32* %122 = OpAccessChain %9 %20 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %9 %20 
                                 f32 %124 = OpLoad %123 
                                 f32 %126 = OpFMul %124 %125 
                        Private f32* %127 = OpAccessChain %9 %30 
                                              OpStore %127 %126 
                          Input f32* %128 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %129 = OpLoad %128 
                                 f32 %130 = OpExtInst %1 4 %129 
                          Input f32* %132 = OpAccessChain vs_TEXCOORD1 %131 
                                 f32 %133 = OpLoad %132 
                                 f32 %134 = OpExtInst %1 4 %133 
                                 f32 %135 = OpExtInst %1 40 %130 %134 
                                              OpStore %39 %135 
                                 f32 %136 = OpLoad %39 
                                 f32 %137 = OpFDiv %36 %136 
                                              OpStore %39 %137 
                          Input f32* %138 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %139 = OpLoad %138 
                                 f32 %140 = OpExtInst %1 4 %139 
                          Input f32* %141 = OpAccessChain vs_TEXCOORD1 %131 
                                 f32 %142 = OpLoad %141 
                                 f32 %143 = OpExtInst %1 4 %142 
                                 f32 %144 = OpExtInst %1 37 %140 %143 
                                              OpStore %52 %144 
                                 f32 %145 = OpLoad %39 
                                 f32 %146 = OpLoad %52 
                                 f32 %147 = OpFMul %145 %146 
                                              OpStore %39 %147 
                                 f32 %148 = OpLoad %39 
                                 f32 %149 = OpLoad %39 
                                 f32 %150 = OpFMul %148 %149 
                                              OpStore %52 %150 
                                 f32 %152 = OpLoad %52 
                                 f32 %153 = OpFMul %152 %54 
                                 f32 %154 = OpFAdd %153 %56 
                                              OpStore %151 %154 
                                 f32 %155 = OpLoad %52 
                                 f32 %156 = OpLoad %151 
                                 f32 %157 = OpFMul %155 %156 
                                 f32 %158 = OpFAdd %157 %61 
                                              OpStore %151 %158 
                                 f32 %159 = OpLoad %52 
                                 f32 %160 = OpLoad %151 
                                 f32 %161 = OpFMul %159 %160 
                                 f32 %162 = OpFAdd %161 %66 
                                              OpStore %151 %162 
                                 f32 %163 = OpLoad %52 
                                 f32 %164 = OpLoad %151 
                                 f32 %165 = OpFMul %163 %164 
                                 f32 %166 = OpFAdd %165 %71 
                                              OpStore %52 %166 
                                 f32 %167 = OpLoad %52 
                                 f32 %168 = OpLoad %39 
                                 f32 %169 = OpFMul %167 %168 
                                              OpStore %151 %169 
                                 f32 %170 = OpLoad %151 
                                 f32 %171 = OpFMul %170 %77 
                                 f32 %172 = OpFAdd %171 %79 
                                              OpStore %151 %172 
                          Input f32* %174 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %175 = OpLoad %174 
                                 f32 %176 = OpExtInst %1 4 %175 
                          Input f32* %177 = OpAccessChain vs_TEXCOORD1 %131 
                                 f32 %178 = OpLoad %177 
                                 f32 %179 = OpExtInst %1 4 %178 
                                bool %180 = OpFOrdLessThan %176 %179 
                                              OpStore %173 %180 
                                bool %181 = OpLoad %173 
                                 f32 %182 = OpLoad %151 
                                 f32 %183 = OpSelect %181 %182 %105 
                                              OpStore %151 %183 
                                 f32 %184 = OpLoad %39 
                                 f32 %185 = OpLoad %52 
                                 f32 %186 = OpFMul %184 %185 
                                 f32 %187 = OpLoad %151 
                                 f32 %188 = OpFAdd %186 %187 
                                              OpStore %39 %188 
                                 f32 %189 = OpLoad %39 
                                 f32 %190 = OpFMul %189 %125 
                        Private f32* %191 = OpAccessChain %9 %20 
                                              OpStore %191 %190 
                 read_only Texture2D %195 = OpLoad %194 
                             sampler %199 = OpLoad %198 
          read_only Texture2DSampled %201 = OpSampledImage %195 %199 
                               f32_3 %202 = OpLoad %9 
                               f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                               f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                               f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                              OpStore %9 %205 
                          Input f32* %207 = OpAccessChain vs_TEXCOORD1 %30 
                                 f32 %208 = OpLoad %207 
                                bool %209 = OpFOrdGreaterThanEqual %208 %105 
                                              OpStore %206 %209 
                                bool %210 = OpLoad %206 
                                 f32 %211 = OpSelect %210 %36 %105 
                                              OpStore %52 %211 
                                 f32 %214 = OpLoad %52 
                               f32_4 %215 = OpCompositeConstruct %214 %214 %214 %214 
                               f32_3 %216 = OpLoad %9 
                               f32_4 %217 = OpVectorShuffle %216 %216 0 1 2 0 
                               f32_4 %218 = OpFMul %215 %217 
                                              OpStore %213 %218 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat4 = max(vs_TEXCOORD1.x, vs_TEXCOORD1.z);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb2 = u_xlatb4 && u_xlatb2;
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 3.14159012;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat4 = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.z = u_xlat4 + 1.57079506;
    u_xlat0.xy = u_xlat0.xz * vec2(0.159155071, 0.318310142);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0 = u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 268
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %264 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %251 DescriptorSet 251 
                                              OpDecorate %251 Binding 251 
                                              OpDecorate %255 DescriptorSet 255 
                                              OpDecorate %255 Binding 255 
                                              OpDecorate %264 Location 264 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                       Private bool* %129 = OpVariable Private 
                                     %138 = OpTypePointer Function %6 
                                 f32 %152 = OpConstant 3.674022E-40 
                                     %155 = OpTypeVector %6 2 
                        Private f32* %163 = OpVariable Private 
                                 u32 %165 = OpConstant 1 
                        Private f32* %172 = OpVariable Private 
                        Private f32* %184 = OpVariable Private 
                       Private bool* %206 = OpVariable Private 
                                 f32 %238 = OpConstant 3.674022E-40 
                                 f32 %243 = OpConstant 3.674022E-40 
                                 f32 %244 = OpConstant 3.674022E-40 
                               f32_2 %245 = OpConstantComposite %243 %244 
                                     %249 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %250 = OpTypePointer UniformConstant %249 
UniformConstant read_only Texture2D* %251 = OpVariable UniformConstant 
                                     %253 = OpTypeSampler 
                                     %254 = OpTypePointer UniformConstant %253 
            UniformConstant sampler* %255 = OpVariable UniformConstant 
                                     %257 = OpTypeSampledImage %249 
                                     %263 = OpTypePointer Output %10 
                       Output f32_4* %264 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %139 = OpVariable Function 
                       Function f32* %229 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 37 %116 %118 
                                              OpStore %31 %119 
                                 f32 %120 = OpLoad %31 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpFNegate %121 
                                bool %123 = OpFOrdLessThan %120 %122 
                                              OpStore %100 %123 
                          Input f32* %124 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %125 = OpLoad %124 
                          Input f32* %126 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %127 = OpLoad %126 
                                 f32 %128 = OpExtInst %1 40 %125 %127 
                                              OpStore %49 %128 
                                 f32 %130 = OpLoad %49 
                                 f32 %131 = OpLoad %49 
                                 f32 %132 = OpFNegate %131 
                                bool %133 = OpFOrdGreaterThanEqual %130 %132 
                                              OpStore %129 %133 
                                bool %134 = OpLoad %129 
                                bool %135 = OpLoad %100 
                                bool %136 = OpLogicalAnd %134 %135 
                                              OpStore %100 %136 
                                bool %137 = OpLoad %100 
                                              OpSelectionMerge %141 None 
                                              OpBranchConditional %137 %140 %145 
                                     %140 = OpLabel 
                        Private f32* %142 = OpAccessChain %9 %14 
                                 f32 %143 = OpLoad %142 
                                 f32 %144 = OpFNegate %143 
                                              OpStore %139 %144 
                                              OpBranch %141 
                                     %145 = OpLabel 
                        Private f32* %146 = OpAccessChain %9 %14 
                                 f32 %147 = OpLoad %146 
                                              OpStore %139 %147 
                                              OpBranch %141 
                                     %141 = OpLabel 
                                 f32 %148 = OpLoad %139 
                        Private f32* %149 = OpAccessChain %9 %14 
                                              OpStore %149 %148 
                        Private f32* %150 = OpAccessChain %9 %14 
                                 f32 %151 = OpLoad %150 
                                 f32 %153 = OpFAdd %151 %152 
                        Private f32* %154 = OpAccessChain %9 %14 
                                              OpStore %154 %153 
                               f32_4 %156 = OpLoad vs_TEXCOORD1 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 2 
                               f32_4 %158 = OpLoad vs_TEXCOORD1 
                               f32_2 %159 = OpVectorShuffle %158 %158 0 2 
                                 f32 %160 = OpDot %157 %159 
                                              OpStore %49 %160 
                                 f32 %161 = OpLoad %49 
                                 f32 %162 = OpExtInst %1 31 %161 
                                              OpStore %49 %162 
                                 f32 %164 = OpLoad %49 
                          Input f32* %166 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %167 = OpLoad %166 
                                 f32 %168 = OpExtInst %1 4 %167 
                                 f32 %169 = OpExtInst %1 40 %164 %168 
                                              OpStore %163 %169 
                                 f32 %170 = OpLoad %163 
                                 f32 %171 = OpFDiv %26 %170 
                                              OpStore %163 %171 
                                 f32 %173 = OpLoad %49 
                          Input f32* %174 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %175 = OpLoad %174 
                                 f32 %176 = OpExtInst %1 4 %175 
                                 f32 %177 = OpExtInst %1 37 %173 %176 
                                              OpStore %172 %177 
                                 f32 %178 = OpLoad %163 
                                 f32 %179 = OpLoad %172 
                                 f32 %180 = OpFMul %178 %179 
                                              OpStore %163 %180 
                                 f32 %181 = OpLoad %163 
                                 f32 %182 = OpLoad %163 
                                 f32 %183 = OpFMul %181 %182 
                                              OpStore %172 %183 
                                 f32 %185 = OpLoad %172 
                                 f32 %186 = OpFMul %185 %51 
                                 f32 %187 = OpFAdd %186 %53 
                                              OpStore %184 %187 
                                 f32 %188 = OpLoad %172 
                                 f32 %189 = OpLoad %184 
                                 f32 %190 = OpFMul %188 %189 
                                 f32 %191 = OpFAdd %190 %58 
                                              OpStore %184 %191 
                                 f32 %192 = OpLoad %172 
                                 f32 %193 = OpLoad %184 
                                 f32 %194 = OpFMul %192 %193 
                                 f32 %195 = OpFAdd %194 %63 
                                              OpStore %184 %195 
                                 f32 %196 = OpLoad %172 
                                 f32 %197 = OpLoad %184 
                                 f32 %198 = OpFMul %196 %197 
                                 f32 %199 = OpFAdd %198 %68 
                                              OpStore %172 %199 
                                 f32 %200 = OpLoad %163 
                                 f32 %201 = OpLoad %172 
                                 f32 %202 = OpFMul %200 %201 
                                              OpStore %184 %202 
                                 f32 %203 = OpLoad %184 
                                 f32 %204 = OpFMul %203 %75 
                                 f32 %205 = OpFAdd %204 %77 
                                              OpStore %184 %205 
                                 f32 %207 = OpLoad %49 
                          Input f32* %208 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %209 = OpLoad %208 
                                 f32 %210 = OpExtInst %1 4 %209 
                                bool %211 = OpFOrdLessThan %207 %210 
                                              OpStore %206 %211 
                                 f32 %212 = OpLoad %49 
                          Input f32* %213 = OpAccessChain vs_TEXCOORD1 %165 
                                 f32 %214 = OpLoad %213 
                                 f32 %215 = OpExtInst %1 37 %212 %214 
                                              OpStore %49 %215 
                                 f32 %216 = OpLoad %49 
                                 f32 %217 = OpLoad %49 
                                 f32 %218 = OpFNegate %217 
                                bool %219 = OpFOrdLessThan %216 %218 
                                              OpStore %129 %219 
                                bool %220 = OpLoad %206 
                                 f32 %221 = OpLoad %184 
                                 f32 %222 = OpSelect %220 %221 %91 
                                              OpStore %184 %222 
                                 f32 %223 = OpLoad %163 
                                 f32 %224 = OpLoad %172 
                                 f32 %225 = OpFMul %223 %224 
                                 f32 %226 = OpLoad %184 
                                 f32 %227 = OpFAdd %225 %226 
                                              OpStore %163 %227 
                                bool %228 = OpLoad %129 
                                              OpSelectionMerge %231 None 
                                              OpBranchConditional %228 %230 %234 
                                     %230 = OpLabel 
                                 f32 %232 = OpLoad %163 
                                 f32 %233 = OpFNegate %232 
                                              OpStore %229 %233 
                                              OpBranch %231 
                                     %234 = OpLabel 
                                 f32 %235 = OpLoad %163 
                                              OpStore %229 %235 
                                              OpBranch %231 
                                     %231 = OpLabel 
                                 f32 %236 = OpLoad %229 
                                              OpStore %49 %236 
                                 f32 %237 = OpLoad %49 
                                 f32 %239 = OpFAdd %237 %238 
                        Private f32* %240 = OpAccessChain %9 %19 
                                              OpStore %240 %239 
                               f32_3 %241 = OpLoad %9 
                               f32_2 %242 = OpVectorShuffle %241 %241 0 2 
                               f32_2 %246 = OpFMul %242 %245 
                               f32_3 %247 = OpLoad %9 
                               f32_3 %248 = OpVectorShuffle %247 %246 3 4 2 
                                              OpStore %9 %248 
                 read_only Texture2D %252 = OpLoad %251 
                             sampler %256 = OpLoad %255 
          read_only Texture2DSampled %258 = OpSampledImage %252 %256 
                               f32_3 %259 = OpLoad %9 
                               f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                               f32_4 %261 = OpImageSampleImplicitLod %258 %260 
                               f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                              OpStore %9 %262 
                               f32_3 %265 = OpLoad %9 
                               f32_4 %266 = OpVectorShuffle %265 %265 0 1 2 0 
                                              OpStore %264 %266 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat4 = u_xlat2 * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat2 * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat2 * u_xlat4 + -0.330299497;
    u_xlat2 = u_xlat2 * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat2 * u_xlat0.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb6 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat4 = u_xlatb6 ? u_xlat4 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlatb2 = vs_TEXCOORD1.x<(-vs_TEXCOORD1.x);
    u_xlat2 = u_xlatb2 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat2 + u_xlat0.x;
    u_xlat2 = min(vs_TEXCOORD1.x, abs(vs_TEXCOORD1.z));
    u_xlatb2 = u_xlat2<(-u_xlat2);
    u_xlat0.x = (u_xlatb2) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat4 = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat6 = max(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(u_xlat4, abs(vs_TEXCOORD1.y));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = u_xlat4<abs(vs_TEXCOORD1.y);
    u_xlat4 = min(u_xlat4, vs_TEXCOORD1.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlat4 = (u_xlatb4) ? (-u_xlat6) : u_xlat6;
    u_xlat0.z = u_xlat4 + 1.57079506;
    u_xlat0.xy = u_xlat0.xz * vec2(0.318310142, 0.318310142);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0 = u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 251
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %247 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %234 DescriptorSet 234 
                                              OpDecorate %234 Binding 234 
                                              OpDecorate %238 DescriptorSet 238 
                                              OpDecorate %238 Binding 238 
                                              OpDecorate %247 Location 247 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Input %6 
                                  u32 %19 = OpConstant 2 
                                      %24 = OpTypePointer Private %6 
                                  f32 %26 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %49 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %79 = OpTypeBool 
                                      %80 = OpTypePointer Private %79 
                        Private bool* %81 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                       Private bool* %100 = OpVariable Private 
                                 f32 %108 = OpConstant 3.674022E-40 
                                     %126 = OpTypePointer Function %6 
                                     %138 = OpTypeVector %6 2 
                        Private f32* %146 = OpVariable Private 
                                 u32 %148 = OpConstant 1 
                        Private f32* %155 = OpVariable Private 
                        Private f32* %167 = OpVariable Private 
                       Private bool* %189 = OpVariable Private 
                       Private bool* %199 = OpVariable Private 
                                 f32 %222 = OpConstant 3.674022E-40 
                                 f32 %227 = OpConstant 3.674022E-40 
                               f32_2 %228 = OpConstantComposite %227 %227 
                                     %232 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %233 = OpTypePointer UniformConstant %232 
UniformConstant read_only Texture2D* %234 = OpVariable UniformConstant 
                                     %236 = OpTypeSampler 
                                     %237 = OpTypePointer UniformConstant %236 
            UniformConstant sampler* %238 = OpVariable UniformConstant 
                                     %240 = OpTypeSampledImage %232 
                                     %246 = OpTypePointer Output %10 
                       Output f32_4* %247 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %127 = OpVariable Function 
                       Function f32* %213 = OpVariable Function 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %18 = OpExtInst %1 4 %17 
                           Input f32* %20 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                                  f32 %23 = OpExtInst %1 40 %18 %22 
                         Private f32* %25 = OpAccessChain %9 %14 
                                              OpStore %25 %23 
                         Private f32* %27 = OpAccessChain %9 %14 
                                  f32 %28 = OpLoad %27 
                                  f32 %29 = OpFDiv %26 %28 
                         Private f32* %30 = OpAccessChain %9 %14 
                                              OpStore %30 %29 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                           Input f32* %35 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                         Private f32* %39 = OpAccessChain %9 %14 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpFMul %40 %41 
                         Private f32* %43 = OpAccessChain %9 %14 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %14 
                                  f32 %45 = OpLoad %44 
                         Private f32* %46 = OpAccessChain %9 %14 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %45 %47 
                                              OpStore %31 %48 
                                  f32 %50 = OpLoad %31 
                                  f32 %52 = OpFMul %50 %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %49 %54 
                                  f32 %55 = OpLoad %31 
                                  f32 %56 = OpLoad %49 
                                  f32 %57 = OpFMul %55 %56 
                                  f32 %59 = OpFAdd %57 %58 
                                              OpStore %49 %59 
                                  f32 %60 = OpLoad %31 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpFMul %60 %61 
                                  f32 %64 = OpFAdd %62 %63 
                                              OpStore %49 %64 
                                  f32 %65 = OpLoad %31 
                                  f32 %66 = OpLoad %49 
                                  f32 %67 = OpFMul %65 %66 
                                  f32 %69 = OpFAdd %67 %68 
                                              OpStore %31 %69 
                                  f32 %70 = OpLoad %31 
                         Private f32* %71 = OpAccessChain %9 %14 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %49 %73 
                                  f32 %74 = OpLoad %49 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                                              OpStore %49 %78 
                           Input f32* %82 = OpAccessChain vs_TEXCOORD1 %14 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpExtInst %1 4 %83 
                           Input f32* %85 = OpAccessChain vs_TEXCOORD1 %19 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 4 %86 
                                 bool %88 = OpFOrdLessThan %84 %87 
                                              OpStore %81 %88 
                                 bool %89 = OpLoad %81 
                                  f32 %90 = OpLoad %49 
                                  f32 %92 = OpSelect %89 %90 %91 
                                              OpStore %49 %92 
                         Private f32* %93 = OpAccessChain %9 %14 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpLoad %31 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %97 = OpLoad %49 
                                  f32 %98 = OpFAdd %96 %97 
                         Private f32* %99 = OpAccessChain %9 %14 
                                              OpStore %99 %98 
                          Input f32* %101 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %102 = OpLoad %101 
                          Input f32* %103 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFNegate %104 
                                bool %106 = OpFOrdLessThan %102 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                 f32 %109 = OpSelect %107 %108 %91 
                                              OpStore %31 %109 
                                 f32 %110 = OpLoad %31 
                        Private f32* %111 = OpAccessChain %9 %14 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpFAdd %110 %112 
                        Private f32* %114 = OpAccessChain %9 %14 
                                              OpStore %114 %113 
                          Input f32* %115 = OpAccessChain vs_TEXCOORD1 %14 
                                 f32 %116 = OpLoad %115 
                          Input f32* %117 = OpAccessChain vs_TEXCOORD1 %19 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpExtInst %1 4 %118 
                                 f32 %120 = OpExtInst %1 37 %116 %119 
                                              OpStore %31 %120 
                                 f32 %121 = OpLoad %31 
                                 f32 %122 = OpLoad %31 
                                 f32 %123 = OpFNegate %122 
                                bool %124 = OpFOrdLessThan %121 %123 
                                              OpStore %100 %124 
                                bool %125 = OpLoad %100 
                                              OpSelectionMerge %129 None 
                                              OpBranchConditional %125 %128 %133 
                                     %128 = OpLabel 
                        Private f32* %130 = OpAccessChain %9 %14 
                                 f32 %131 = OpLoad %130 
                                 f32 %132 = OpFNegate %131 
                                              OpStore %127 %132 
                                              OpBranch %129 
                                     %133 = OpLabel 
                        Private f32* %134 = OpAccessChain %9 %14 
                                 f32 %135 = OpLoad %134 
                                              OpStore %127 %135 
                                              OpBranch %129 
                                     %129 = OpLabel 
                                 f32 %136 = OpLoad %127 
                        Private f32* %137 = OpAccessChain %9 %14 
                                              OpStore %137 %136 
                               f32_4 %139 = OpLoad vs_TEXCOORD1 
                               f32_2 %140 = OpVectorShuffle %139 %139 0 2 
                               f32_4 %141 = OpLoad vs_TEXCOORD1 
                               f32_2 %142 = OpVectorShuffle %141 %141 0 2 
                                 f32 %143 = OpDot %140 %142 
                                              OpStore %49 %143 
                                 f32 %144 = OpLoad %49 
                                 f32 %145 = OpExtInst %1 31 %144 
                                              OpStore %49 %145 
                                 f32 %147 = OpLoad %49 
                          Input f32* %149 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %150 = OpLoad %149 
                                 f32 %151 = OpExtInst %1 4 %150 
                                 f32 %152 = OpExtInst %1 40 %147 %151 
                                              OpStore %146 %152 
                                 f32 %153 = OpLoad %146 
                                 f32 %154 = OpFDiv %26 %153 
                                              OpStore %146 %154 
                                 f32 %156 = OpLoad %49 
                          Input f32* %157 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %158 = OpLoad %157 
                                 f32 %159 = OpExtInst %1 4 %158 
                                 f32 %160 = OpExtInst %1 37 %156 %159 
                                              OpStore %155 %160 
                                 f32 %161 = OpLoad %146 
                                 f32 %162 = OpLoad %155 
                                 f32 %163 = OpFMul %161 %162 
                                              OpStore %146 %163 
                                 f32 %164 = OpLoad %146 
                                 f32 %165 = OpLoad %146 
                                 f32 %166 = OpFMul %164 %165 
                                              OpStore %155 %166 
                                 f32 %168 = OpLoad %155 
                                 f32 %169 = OpFMul %168 %51 
                                 f32 %170 = OpFAdd %169 %53 
                                              OpStore %167 %170 
                                 f32 %171 = OpLoad %155 
                                 f32 %172 = OpLoad %167 
                                 f32 %173 = OpFMul %171 %172 
                                 f32 %174 = OpFAdd %173 %58 
                                              OpStore %167 %174 
                                 f32 %175 = OpLoad %155 
                                 f32 %176 = OpLoad %167 
                                 f32 %177 = OpFMul %175 %176 
                                 f32 %178 = OpFAdd %177 %63 
                                              OpStore %167 %178 
                                 f32 %179 = OpLoad %155 
                                 f32 %180 = OpLoad %167 
                                 f32 %181 = OpFMul %179 %180 
                                 f32 %182 = OpFAdd %181 %68 
                                              OpStore %155 %182 
                                 f32 %183 = OpLoad %146 
                                 f32 %184 = OpLoad %155 
                                 f32 %185 = OpFMul %183 %184 
                                              OpStore %167 %185 
                                 f32 %186 = OpLoad %167 
                                 f32 %187 = OpFMul %186 %75 
                                 f32 %188 = OpFAdd %187 %77 
                                              OpStore %167 %188 
                                 f32 %190 = OpLoad %49 
                          Input f32* %191 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %192 = OpLoad %191 
                                 f32 %193 = OpExtInst %1 4 %192 
                                bool %194 = OpFOrdLessThan %190 %193 
                                              OpStore %189 %194 
                                 f32 %195 = OpLoad %49 
                          Input f32* %196 = OpAccessChain vs_TEXCOORD1 %148 
                                 f32 %197 = OpLoad %196 
                                 f32 %198 = OpExtInst %1 37 %195 %197 
                                              OpStore %49 %198 
                                 f32 %200 = OpLoad %49 
                                 f32 %201 = OpLoad %49 
                                 f32 %202 = OpFNegate %201 
                                bool %203 = OpFOrdLessThan %200 %202 
                                              OpStore %199 %203 
                                bool %204 = OpLoad %189 
                                 f32 %205 = OpLoad %167 
                                 f32 %206 = OpSelect %204 %205 %91 
                                              OpStore %167 %206 
                                 f32 %207 = OpLoad %146 
                                 f32 %208 = OpLoad %155 
                                 f32 %209 = OpFMul %207 %208 
                                 f32 %210 = OpLoad %167 
                                 f32 %211 = OpFAdd %209 %210 
                                              OpStore %146 %211 
                                bool %212 = OpLoad %199 
                                              OpSelectionMerge %215 None 
                                              OpBranchConditional %212 %214 %218 
                                     %214 = OpLabel 
                                 f32 %216 = OpLoad %146 
                                 f32 %217 = OpFNegate %216 
                                              OpStore %213 %217 
                                              OpBranch %215 
                                     %218 = OpLabel 
                                 f32 %219 = OpLoad %146 
                                              OpStore %213 %219 
                                              OpBranch %215 
                                     %215 = OpLabel 
                                 f32 %220 = OpLoad %213 
                                              OpStore %49 %220 
                                 f32 %221 = OpLoad %49 
                                 f32 %223 = OpFAdd %221 %222 
                        Private f32* %224 = OpAccessChain %9 %19 
                                              OpStore %224 %223 
                               f32_3 %225 = OpLoad %9 
                               f32_2 %226 = OpVectorShuffle %225 %225 0 2 
                               f32_2 %229 = OpFMul %226 %228 
                               f32_3 %230 = OpLoad %9 
                               f32_3 %231 = OpVectorShuffle %230 %229 3 4 2 
                                              OpStore %9 %231 
                 read_only Texture2D %235 = OpLoad %234 
                             sampler %239 = OpLoad %238 
          read_only Texture2DSampled %241 = OpSampledImage %235 %239 
                               f32_3 %242 = OpLoad %9 
                               f32_2 %243 = OpVectorShuffle %242 %242 0 1 
                               f32_4 %244 = OpImageSampleImplicitLod %241 %243 
                               f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                              OpStore %9 %245 
                               f32_3 %248 = OpLoad %9 
                               f32_4 %249 = OpVectorShuffle %248 %248 0 1 2 0 
                                              OpStore %247 %249 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xz, vs_TEXCOORD1.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2 = max(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat4 = min(u_xlat0.x, abs(vs_TEXCOORD1.y));
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat4 = u_xlat2 * u_xlat2;
    u_xlat6 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat4 * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat4 * u_xlat6 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat4 * u_xlat2;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
    u_xlatb1 = u_xlat0.x<abs(vs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, vs_TEXCOORD1.y);
    u_xlatb0 = u_xlat0.x<(-u_xlat0.x);
    u_xlat6 = u_xlatb1 ? u_xlat6 : float(0.0);
    u_xlat2 = u_xlat2 * u_xlat4 + u_xlat6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat2) : u_xlat2;
    u_xlat0.x = u_xlat0.x + 1.57079506;
    u_xlat0.y = u_xlat0.x * 0.318310142;
    u_xlat4 = max(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(vs_TEXCOORD1.x), abs(vs_TEXCOORD1.z));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1 = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat6 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat6 * u_xlat1 + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat6 * u_xlat4;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb3 = abs(vs_TEXCOORD1.x)<abs(vs_TEXCOORD1.z);
    u_xlat1 = u_xlatb3 ? u_xlat1 : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1;
    u_xlat0.x = u_xlat4 * 0.636620283;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0 = u_xlat0.xyzx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate vs_TEXCOORD1 Location 64 
                                                     OpMemberDecorate %93 0 BuiltIn 93 
                                                     OpMemberDecorate %93 1 BuiltIn 93 
                                                     OpMemberDecorate %93 2 BuiltIn 93 
                                                     OpDecorate %93 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %91 = OpConstant 1 
                                             %92 = OpTypeArray %6 %91 
                                             %93 = OpTypeStruct %13 %6 %92 
                                             %94 = OpTypePointer Output %93 
        Output struct {f32_4; f32; f32[1];}* %95 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore vs_TEXCOORD1 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %96 = OpAccessChain %20 %39 %59 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpLoad %57 
                                       f32_4 %99 = OpVectorShuffle %98 %98 3 3 3 3 
                                      f32_4 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %33 
                                      f32_4 %102 = OpFAdd %100 %101 
                              Output f32_4* %103 = OpAccessChain %95 %38 
                                                     OpStore %103 %102 
                                Output f32* %105 = OpAccessChain %95 %38 %91 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %95 %38 %91 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 217
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %213 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 12 
                                              OpDecorate %200 DescriptorSet 200 
                                              OpDecorate %200 Binding 200 
                                              OpDecorate %204 DescriptorSet 204 
                                              OpDecorate %204 Binding 204 
                                              OpDecorate %213 Location 213 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypePointer Input %10 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      %13 = OpTypeVector %6 2 
                                      %19 = OpTypeInt 32 0 
                                  u32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Private %6 
                         Private f32* %27 = OpVariable Private 
                                  u32 %30 = OpConstant 1 
                                      %31 = OpTypePointer Input %6 
                                  f32 %36 = OpConstant 3.674022E-40 
                         Private f32* %39 = OpVariable Private 
                         Private f32* %52 = OpVariable Private 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                  f32 %61 = OpConstant 3.674022E-40 
                                  f32 %66 = OpConstant 3.674022E-40 
                                  f32 %71 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                  f32 %79 = OpConstant 3.674022E-40 
                                      %81 = OpTypeBool 
                                      %82 = OpTypePointer Private %81 
                        Private bool* %83 = OpVariable Private 
                        Private bool* %96 = OpVariable Private 
                                 f32 %105 = OpConstant 3.674022E-40 
                                     %113 = OpTypePointer Function %6 
                                 f32 %125 = OpConstant 3.674022E-40 
                                 f32 %130 = OpConstant 3.674022E-40 
                                 u32 %136 = OpConstant 2 
                        Private f32* %156 = OpVariable Private 
                       Private bool* %178 = OpVariable Private 
                                 f32 %195 = OpConstant 3.674022E-40 
                                     %198 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %199 = OpTypePointer UniformConstant %198 
UniformConstant read_only Texture2D* %200 = OpVariable UniformConstant 
                                     %202 = OpTypeSampler 
                                     %203 = OpTypePointer UniformConstant %202 
            UniformConstant sampler* %204 = OpVariable UniformConstant 
                                     %206 = OpTypeSampledImage %198 
                                     %212 = OpTypePointer Output %10 
                       Output f32_4* %213 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %114 = OpVariable Function 
                                f32_4 %14 = OpLoad vs_TEXCOORD1 
                                f32_2 %15 = OpVectorShuffle %14 %14 0 2 
                                f32_4 %16 = OpLoad vs_TEXCOORD1 
                                f32_2 %17 = OpVectorShuffle %16 %16 0 2 
                                  f32 %18 = OpDot %15 %17 
                         Private f32* %22 = OpAccessChain %9 %20 
                                              OpStore %22 %18 
                         Private f32* %23 = OpAccessChain %9 %20 
                                  f32 %24 = OpLoad %23 
                                  f32 %25 = OpExtInst %1 31 %24 
                         Private f32* %26 = OpAccessChain %9 %20 
                                              OpStore %26 %25 
                         Private f32* %28 = OpAccessChain %9 %20 
                                  f32 %29 = OpLoad %28 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                                  f32 %35 = OpExtInst %1 40 %29 %34 
                                              OpStore %27 %35 
                                  f32 %37 = OpLoad %27 
                                  f32 %38 = OpFDiv %36 %37 
                                              OpStore %27 %38 
                         Private f32* %40 = OpAccessChain %9 %20 
                                  f32 %41 = OpLoad %40 
                           Input f32* %42 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %43 = OpLoad %42 
                                  f32 %44 = OpExtInst %1 4 %43 
                                  f32 %45 = OpExtInst %1 37 %41 %44 
                                              OpStore %39 %45 
                                  f32 %46 = OpLoad %27 
                                  f32 %47 = OpLoad %39 
                                  f32 %48 = OpFMul %46 %47 
                                              OpStore %27 %48 
                                  f32 %49 = OpLoad %27 
                                  f32 %50 = OpLoad %27 
                                  f32 %51 = OpFMul %49 %50 
                                              OpStore %39 %51 
                                  f32 %53 = OpLoad %39 
                                  f32 %55 = OpFMul %53 %54 
                                  f32 %57 = OpFAdd %55 %56 
                                              OpStore %52 %57 
                                  f32 %58 = OpLoad %39 
                                  f32 %59 = OpLoad %52 
                                  f32 %60 = OpFMul %58 %59 
                                  f32 %62 = OpFAdd %60 %61 
                                              OpStore %52 %62 
                                  f32 %63 = OpLoad %39 
                                  f32 %64 = OpLoad %52 
                                  f32 %65 = OpFMul %63 %64 
                                  f32 %67 = OpFAdd %65 %66 
                                              OpStore %52 %67 
                                  f32 %68 = OpLoad %39 
                                  f32 %69 = OpLoad %52 
                                  f32 %70 = OpFMul %68 %69 
                                  f32 %72 = OpFAdd %70 %71 
                                              OpStore %39 %72 
                                  f32 %73 = OpLoad %39 
                                  f32 %74 = OpLoad %27 
                                  f32 %75 = OpFMul %73 %74 
                                              OpStore %52 %75 
                                  f32 %76 = OpLoad %52 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %80 = OpFAdd %78 %79 
                                              OpStore %52 %80 
                         Private f32* %84 = OpAccessChain %9 %20 
                                  f32 %85 = OpLoad %84 
                           Input f32* %86 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpExtInst %1 4 %87 
                                 bool %89 = OpFOrdLessThan %85 %88 
                                              OpStore %83 %89 
                         Private f32* %90 = OpAccessChain %9 %20 
                                  f32 %91 = OpLoad %90 
                           Input f32* %92 = OpAccessChain vs_TEXCOORD1 %30 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpExtInst %1 37 %91 %93 
                         Private f32* %95 = OpAccessChain %9 %20 
                                              OpStore %95 %94 
                         Private f32* %97 = OpAccessChain %9 %20 
                                  f32 %98 = OpLoad %97 
                         Private f32* %99 = OpAccessChain %9 %20 
                                 f32 %100 = OpLoad %99 
                                 f32 %101 = OpFNegate %100 
                                bool %102 = OpFOrdLessThan %98 %101 
                                              OpStore %96 %102 
                                bool %103 = OpLoad %83 
                                 f32 %104 = OpLoad %52 
                                 f32 %106 = OpSelect %103 %104 %105 
                                              OpStore %52 %106 
                                 f32 %107 = OpLoad %27 
                                 f32 %108 = OpLoad %39 
                                 f32 %109 = OpFMul %107 %108 
                                 f32 %110 = OpLoad %52 
                                 f32 %111 = OpFAdd %109 %110 
                                              OpStore %27 %111 
                                bool %112 = OpLoad %96 
                                              OpSelectionMerge %116 None 
                                              OpBranchConditional %112 %115 %119 
                                     %115 = OpLabel 
                                 f32 %117 = OpLoad %27 
                                 f32 %118 = OpFNegate %117 
                                              OpStore %114 %118 
                                              OpBranch %116 
                                     %119 = OpLabel 
                                 f32 %120 = OpLoad %27 
                                              OpStore %114 %120 
                                              OpBranch %116 
                                     %116 = OpLabel 
                                 f32 %121 = OpLoad %114 
                        Private f32* %122 = OpAccessChain %9 %20 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %9 %20 
                                 f32 %124 = OpLoad %123 
                                 f32 %126 = OpFAdd %124 %125 
                        Private f32* %127 = OpAccessChain %9 %20 
                                              OpStore %127 %126 
                        Private f32* %128 = OpAccessChain %9 %20 
                                 f32 %129 = OpLoad %128 
                                 f32 %131 = OpFMul %129 %130 
                        Private f32* %132 = OpAccessChain %9 %30 
                                              OpStore %132 %131 
                          Input f32* %133 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %134 = OpLoad %133 
                                 f32 %135 = OpExtInst %1 4 %134 
                          Input f32* %137 = OpAccessChain vs_TEXCOORD1 %136 
                                 f32 %138 = OpLoad %137 
                                 f32 %139 = OpExtInst %1 4 %138 
                                 f32 %140 = OpExtInst %1 40 %135 %139 
                                              OpStore %39 %140 
                                 f32 %141 = OpLoad %39 
                                 f32 %142 = OpFDiv %36 %141 
                                              OpStore %39 %142 
                          Input f32* %143 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %144 = OpLoad %143 
                                 f32 %145 = OpExtInst %1 4 %144 
                          Input f32* %146 = OpAccessChain vs_TEXCOORD1 %136 
                                 f32 %147 = OpLoad %146 
                                 f32 %148 = OpExtInst %1 4 %147 
                                 f32 %149 = OpExtInst %1 37 %145 %148 
                                              OpStore %52 %149 
                                 f32 %150 = OpLoad %39 
                                 f32 %151 = OpLoad %52 
                                 f32 %152 = OpFMul %150 %151 
                                              OpStore %39 %152 
                                 f32 %153 = OpLoad %39 
                                 f32 %154 = OpLoad %39 
                                 f32 %155 = OpFMul %153 %154 
                                              OpStore %52 %155 
                                 f32 %157 = OpLoad %52 
                                 f32 %158 = OpFMul %157 %54 
                                 f32 %159 = OpFAdd %158 %56 
                                              OpStore %156 %159 
                                 f32 %160 = OpLoad %52 
                                 f32 %161 = OpLoad %156 
                                 f32 %162 = OpFMul %160 %161 
                                 f32 %163 = OpFAdd %162 %61 
                                              OpStore %156 %163 
                                 f32 %164 = OpLoad %52 
                                 f32 %165 = OpLoad %156 
                                 f32 %166 = OpFMul %164 %165 
                                 f32 %167 = OpFAdd %166 %66 
                                              OpStore %156 %167 
                                 f32 %168 = OpLoad %52 
                                 f32 %169 = OpLoad %156 
                                 f32 %170 = OpFMul %168 %169 
                                 f32 %171 = OpFAdd %170 %71 
                                              OpStore %52 %171 
                                 f32 %172 = OpLoad %52 
                                 f32 %173 = OpLoad %39 
                                 f32 %174 = OpFMul %172 %173 
                                              OpStore %156 %174 
                                 f32 %175 = OpLoad %156 
                                 f32 %176 = OpFMul %175 %77 
                                 f32 %177 = OpFAdd %176 %79 
                                              OpStore %156 %177 
                          Input f32* %179 = OpAccessChain vs_TEXCOORD1 %20 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpExtInst %1 4 %180 
                          Input f32* %182 = OpAccessChain vs_TEXCOORD1 %136 
                                 f32 %183 = OpLoad %182 
                                 f32 %184 = OpExtInst %1 4 %183 
                                bool %185 = OpFOrdLessThan %181 %184 
                                              OpStore %178 %185 
                                bool %186 = OpLoad %178 
                                 f32 %187 = OpLoad %156 
                                 f32 %188 = OpSelect %186 %187 %105 
                                              OpStore %156 %188 
                                 f32 %189 = OpLoad %39 
                                 f32 %190 = OpLoad %52 
                                 f32 %191 = OpFMul %189 %190 
                                 f32 %192 = OpLoad %156 
                                 f32 %193 = OpFAdd %191 %192 
                                              OpStore %39 %193 
                                 f32 %194 = OpLoad %39 
                                 f32 %196 = OpFMul %194 %195 
                        Private f32* %197 = OpAccessChain %9 %20 
                                              OpStore %197 %196 
                 read_only Texture2D %201 = OpLoad %200 
                             sampler %205 = OpLoad %204 
          read_only Texture2DSampled %207 = OpSampledImage %201 %205 
                               f32_3 %208 = OpLoad %9 
                               f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                              OpStore %9 %211 
                               f32_3 %214 = OpLoad %9 
                               f32_4 %215 = OpVectorShuffle %214 %214 0 1 2 0 
                                              OpStore %213 %215 
                                              OpReturn
                                              OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
""
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "FULL_HORIZONTAL" }
""
}
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
""
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "HALF_HORIZONTAL" }
""
}
SubProgram "d3d11 " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
""
}
SubProgram "vulkan " {
Keywords { "BOTTOM_VERTICAL" "QUAD_HORIZONTAL" }
""
}
SubProgram "d3d11 " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "vulkan " {
Keywords { "FULL_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "d3d11 " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "vulkan " {
Keywords { "HALF_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "d3d11 " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "vulkan " {
Keywords { "QUAD_HORIZONTAL" "TOP_VERTICAL" }
""
}
SubProgram "d3d11 " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
""
}
SubProgram "vulkan " {
Keywords { "FULL_HORIZONTAL" "FULL_VERTICAL" }
""
}
SubProgram "d3d11 " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
""
}
SubProgram "vulkan " {
Keywords { "FULL_VERTICAL" "HALF_HORIZONTAL" }
""
}
SubProgram "d3d11 " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
""
}
SubProgram "vulkan " {
Keywords { "FULL_VERTICAL" "QUAD_HORIZONTAL" }
""
}
}
}
}
}