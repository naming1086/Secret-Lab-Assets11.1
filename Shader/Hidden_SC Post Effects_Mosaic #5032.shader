//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Mosaic" {
Properties {
}
SubShader {
 Pass {
  Name "Mosaic: Triangles"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 28525
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Params.xx;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / _Params.xx;
    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD1.xy;
    u_xlat1 = (-u_xlat6.y) * _Params.x + 1.0;
    u_xlat6.xy = u_xlat6.xy * _Params.xx;
    u_xlatb1 = u_xlat6.x>=u_xlat1;
    u_xlatb6 = u_xlat6.y>=u_xlat6.x;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat2.y = u_xlat6.x / _Params.x;
    u_xlat6.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat2.x = u_xlat6.x / _Params.x;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    SV_Target0 = texture(_MainTex, u_xlat0.xy);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 106
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %92 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD1 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %92 Location 92 
                                             OpDecorate %95 DescriptorSet 95 
                                             OpDecorate %95 Binding 95 
                                             OpDecorate %99 DescriptorSet 99 
                                             OpDecorate %99 Binding 99 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %13 = OpTypeVector %6 4 
                                     %14 = OpTypeStruct %13 
                                     %15 = OpTypePointer Uniform %14 
            Uniform struct {f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 0 
                                     %19 = OpTypePointer Uniform %13 
                      Private f32_2* %31 = OpVariable Private 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 1 
                                 u32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %55 = OpTypeBool 
                                     %56 = OpTypePointer Private %55 
                       Private bool* %57 = OpVariable Private 
                       Private bool* %62 = OpVariable Private 
                                 f32 %69 = OpConstant 3.674022E-40 
                      Private f32_2* %72 = OpVariable Private 
                                     %91 = OpTypePointer Output %13 
                       Output f32_4* %92 = OpVariable Output 
                                     %93 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %94 = OpTypePointer UniformConstant %93 
UniformConstant read_only Texture2D* %95 = OpVariable UniformConstant 
                                     %97 = OpTypeSampler 
                                     %98 = OpTypePointer UniformConstant %97 
            UniformConstant sampler* %99 = OpVariable UniformConstant 
                                    %101 = OpTypeSampledImage %93 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %12 = OpLoad vs_TEXCOORD1 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 0 
                               f32_2 %23 = OpFMul %12 %22 
                                             OpStore %9 %23 
                               f32_2 %24 = OpLoad %9 
                               f32_2 %25 = OpExtInst %1 8 %24 
                                             OpStore %9 %25 
                               f32_2 %26 = OpLoad %9 
                      Uniform f32_4* %27 = OpAccessChain %16 %18 
                               f32_4 %28 = OpLoad %27 
                               f32_2 %29 = OpVectorShuffle %28 %28 0 0 
                               f32_2 %30 = OpFDiv %26 %29 
                                             OpStore %9 %30 
                               f32_2 %32 = OpLoad %9 
                               f32_2 %33 = OpFNegate %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD1 
                               f32_2 %35 = OpFAdd %33 %34 
                                             OpStore %31 %35 
                        Private f32* %40 = OpAccessChain %31 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                        Uniform f32* %45 = OpAccessChain %16 %18 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %42 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_2 %50 = OpLoad %31 
                      Uniform f32_4* %51 = OpAccessChain %16 %18 
                               f32_4 %52 = OpLoad %51 
                               f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                               f32_2 %54 = OpFMul %50 %53 
                                             OpStore %31 %54 
                        Private f32* %58 = OpAccessChain %31 %43 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpLoad %37 
                                bool %61 = OpFOrdGreaterThanEqual %59 %60 
                                             OpStore %57 %61 
                        Private f32* %63 = OpAccessChain %31 %39 
                                 f32 %64 = OpLoad %63 
                        Private f32* %65 = OpAccessChain %31 %43 
                                 f32 %66 = OpLoad %65 
                                bool %67 = OpFOrdGreaterThanEqual %64 %66 
                                             OpStore %62 %67 
                                bool %68 = OpLoad %62 
                                 f32 %70 = OpSelect %68 %48 %69 
                        Private f32* %71 = OpAccessChain %31 %43 
                                             OpStore %71 %70 
                        Private f32* %73 = OpAccessChain %31 %43 
                                 f32 %74 = OpLoad %73 
                        Uniform f32* %75 = OpAccessChain %16 %18 %43 
                                 f32 %76 = OpLoad %75 
                                 f32 %77 = OpFDiv %74 %76 
                        Private f32* %78 = OpAccessChain %72 %39 
                                             OpStore %78 %77 
                                bool %79 = OpLoad %57 
                                 f32 %80 = OpSelect %79 %48 %69 
                        Private f32* %81 = OpAccessChain %31 %43 
                                             OpStore %81 %80 
                        Private f32* %82 = OpAccessChain %31 %43 
                                 f32 %83 = OpLoad %82 
                        Uniform f32* %84 = OpAccessChain %16 %18 %43 
                                 f32 %85 = OpLoad %84 
                                 f32 %86 = OpFDiv %83 %85 
                        Private f32* %87 = OpAccessChain %72 %43 
                                             OpStore %87 %86 
                               f32_2 %88 = OpLoad %9 
                               f32_2 %89 = OpLoad %72 
                               f32_2 %90 = OpFAdd %88 %89 
                                             OpStore %9 %90 
                 read_only Texture2D %96 = OpLoad %95 
                            sampler %100 = OpLoad %99 
         read_only Texture2DSampled %102 = OpSampledImage %96 %100 
                              f32_2 %103 = OpLoad %9 
                              f32_4 %104 = OpImageSampleImplicitLod %102 %103 
                                             OpStore %92 %104 
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
 Pass {
  Name "Mosaic: Hex"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 73324
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
float u_xlat2;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
int u_xlati6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _Params.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat4.x = u_xlat0.x + u_xlat0.x;
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlat4.xy = (bool(u_xlatb4)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat6 = u_xlat4.y * u_xlat0.x;
    u_xlat6 = fract(u_xlat6);
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * _Params.y;
    u_xlat4.x = (-u_xlat4.x) * 0.5 + vs_TEXCOORD1.y;
    u_xlat6 = float(1.0) / _Params.y;
    u_xlat6 = u_xlat4.x * u_xlat6;
    u_xlat0.y = floor(u_xlat6);
    u_xlati6 = int(u_xlat0.x);
    u_xlati6 = u_xlati6 + int(0xFFFFFFFFu);
    u_xlat1.x = float(u_xlati6);
    u_xlat6 = u_xlat1.x + u_xlat1.x;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat5.xy = (bool(u_xlatb6)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat6 = u_xlat5.y * u_xlat1.x;
    u_xlat6 = fract(u_xlat6);
    u_xlat6 = (-u_xlat5.x) * u_xlat6 + u_xlat0.y;
    u_xlat4.x = (-u_xlat0.y) * _Params.y + u_xlat4.x;
    u_xlat5.xy = _Params.yx * vec2(0.5, 0.666666687);
    u_xlatb5 = u_xlat5.x<u_xlat4.x;
    u_xlat4.x = u_xlat4.x / _Params.y;
    u_xlat4.x = (-u_xlat4.x) + 0.5;
    u_xlat4.x = abs(u_xlat4.x) * u_xlat5.y;
    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat1.y = u_xlat6 + u_xlat5.x;
    u_xlat6 = (-u_xlat0.x) * _Params.x + vs_TEXCOORD1.x;
    u_xlatb4 = u_xlat4.x<u_xlat6;
    u_xlat0.xy = (bool(u_xlatb4)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat4.x = u_xlat0.x + u_xlat0.x;
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlat4.xy = (bool(u_xlatb4)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat6 = u_xlat4.y * u_xlat0.x;
    u_xlat6 = fract(u_xlat6);
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * _Params.y;
    u_xlat4.x = u_xlat4.x * 0.5;
    u_xlat2 = trunc(u_xlat0.y);
    u_xlat1.x = u_xlat0.x * _Params.x;
    u_xlat1.y = u_xlat2 * _Params.y + u_xlat4.x;
    SV_Target0 = texture(_MainTex, u_xlat1.xy);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 281
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %267 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD1 Location 11 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %267 Location 267 
                                              OpDecorate %270 DescriptorSet 270 
                                              OpDecorate %270 Binding 270 
                                              OpDecorate %274 DescriptorSet 274 
                                              OpDecorate %274 Binding 274 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                      %12 = OpTypeInt 32 0 
                                  u32 %13 = OpConstant 0 
                                      %14 = OpTypePointer Input %6 
                                      %17 = OpTypeVector %6 4 
                                      %18 = OpTypeStruct %17 
                                      %19 = OpTypePointer Uniform %18 
             Uniform struct {f32_4;}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                      %23 = OpTypePointer Uniform %6 
                                      %27 = OpTypePointer Private %6 
                       Private f32_2* %33 = OpVariable Private 
                                      %40 = OpTypeBool 
                                      %41 = OpTypePointer Private %40 
                        Private bool* %42 = OpVariable Private 
                                  f32 %50 = OpConstant 3.674022E-40 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_2 %52 = OpConstantComposite %50 %51 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %54 = OpConstant 3.674022E-40 
                                f32_2 %55 = OpConstantComposite %53 %54 
                                      %56 = OpTypeVector %40 2 
                         Private f32* %59 = OpVariable Private 
                                  u32 %60 = OpConstant 1 
                                  f32 %87 = OpConstant 3.674022E-40 
                                      %98 = OpTypePointer Private %21 
                         Private i32* %99 = OpVariable Private 
                                 i32 %104 = OpConstant -1 
                      Private f32_2* %106 = OpVariable Private 
                       Private bool* %115 = OpVariable Private 
                      Private f32_2* %120 = OpVariable Private 
                                     %149 = OpTypePointer Uniform %17 
                                 f32 %153 = OpConstant 3.674022E-40 
                               f32_2 %154 = OpConstantComposite %51 %153 
                       Private bool* %156 = OpVariable Private 
                                 f32 %181 = OpConstant 3.674022E-40 
                                     %203 = OpTypePointer Function %7 
                        Private f32* %248 = OpVariable Private 
                                     %266 = OpTypePointer Output %17 
                       Output f32_4* %267 = OpVariable Output 
                                     %268 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %269 = OpTypePointer UniformConstant %268 
UniformConstant read_only Texture2D* %270 = OpVariable UniformConstant 
                                     %272 = OpTypeSampler 
                                     %273 = OpTypePointer UniformConstant %272 
            UniformConstant sampler* %274 = OpVariable UniformConstant 
                                     %276 = OpTypeSampledImage %268 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                     Function f32_2* %204 = OpVariable Function 
                           Input f32* %15 = OpAccessChain vs_TEXCOORD1 %13 
                                  f32 %16 = OpLoad %15 
                         Uniform f32* %24 = OpAccessChain %20 %22 %13 
                                  f32 %25 = OpLoad %24 
                                  f32 %26 = OpFDiv %16 %25 
                         Private f32* %28 = OpAccessChain %9 %13 
                                              OpStore %28 %26 
                         Private f32* %29 = OpAccessChain %9 %13 
                                  f32 %30 = OpLoad %29 
                                  f32 %31 = OpExtInst %1 8 %30 
                         Private f32* %32 = OpAccessChain %9 %13 
                                              OpStore %32 %31 
                         Private f32* %34 = OpAccessChain %9 %13 
                                  f32 %35 = OpLoad %34 
                         Private f32* %36 = OpAccessChain %9 %13 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpFAdd %35 %37 
                         Private f32* %39 = OpAccessChain %33 %13 
                                              OpStore %39 %38 
                         Private f32* %43 = OpAccessChain %33 %13 
                                  f32 %44 = OpLoad %43 
                         Private f32* %45 = OpAccessChain %33 %13 
                                  f32 %46 = OpLoad %45 
                                  f32 %47 = OpFNegate %46 
                                 bool %48 = OpFOrdGreaterThanEqual %44 %47 
                                              OpStore %42 %48 
                                 bool %49 = OpLoad %42 
                               bool_2 %57 = OpCompositeConstruct %49 %49 
                                f32_2 %58 = OpSelect %57 %52 %55 
                                              OpStore %33 %58 
                         Private f32* %61 = OpAccessChain %33 %60 
                                  f32 %62 = OpLoad %61 
                         Private f32* %63 = OpAccessChain %9 %13 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFMul %62 %64 
                                              OpStore %59 %65 
                                  f32 %66 = OpLoad %59 
                                  f32 %67 = OpExtInst %1 10 %66 
                                              OpStore %59 %67 
                                  f32 %68 = OpLoad %59 
                         Private f32* %69 = OpAccessChain %33 %13 
                                  f32 %70 = OpLoad %69 
                                  f32 %71 = OpFMul %68 %70 
                         Private f32* %72 = OpAccessChain %33 %13 
                                              OpStore %72 %71 
                         Private f32* %73 = OpAccessChain %33 %13 
                                  f32 %74 = OpLoad %73 
                         Uniform f32* %75 = OpAccessChain %20 %22 %60 
                                  f32 %76 = OpLoad %75 
                                  f32 %77 = OpFMul %74 %76 
                         Private f32* %78 = OpAccessChain %33 %13 
                                              OpStore %78 %77 
                         Private f32* %79 = OpAccessChain %33 %13 
                                  f32 %80 = OpLoad %79 
                                  f32 %81 = OpFNegate %80 
                                  f32 %82 = OpFMul %81 %51 
                           Input f32* %83 = OpAccessChain vs_TEXCOORD1 %60 
                                  f32 %84 = OpLoad %83 
                                  f32 %85 = OpFAdd %82 %84 
                         Private f32* %86 = OpAccessChain %33 %13 
                                              OpStore %86 %85 
                         Uniform f32* %88 = OpAccessChain %20 %22 %60 
                                  f32 %89 = OpLoad %88 
                                  f32 %90 = OpFDiv %87 %89 
                                              OpStore %59 %90 
                         Private f32* %91 = OpAccessChain %33 %13 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpLoad %59 
                                  f32 %94 = OpFMul %92 %93 
                                              OpStore %59 %94 
                                  f32 %95 = OpLoad %59 
                                  f32 %96 = OpExtInst %1 8 %95 
                         Private f32* %97 = OpAccessChain %9 %60 
                                              OpStore %97 %96 
                        Private f32* %100 = OpAccessChain %9 %13 
                                 f32 %101 = OpLoad %100 
                                 i32 %102 = OpConvertFToS %101 
                                              OpStore %99 %102 
                                 i32 %103 = OpLoad %99 
                                 i32 %105 = OpIAdd %103 %104 
                                              OpStore %99 %105 
                                 i32 %107 = OpLoad %99 
                                 f32 %108 = OpConvertSToF %107 
                        Private f32* %109 = OpAccessChain %106 %13 
                                              OpStore %109 %108 
                        Private f32* %110 = OpAccessChain %106 %13 
                                 f32 %111 = OpLoad %110 
                        Private f32* %112 = OpAccessChain %106 %13 
                                 f32 %113 = OpLoad %112 
                                 f32 %114 = OpFAdd %111 %113 
                                              OpStore %59 %114 
                                 f32 %116 = OpLoad %59 
                                 f32 %117 = OpLoad %59 
                                 f32 %118 = OpFNegate %117 
                                bool %119 = OpFOrdGreaterThanEqual %116 %118 
                                              OpStore %115 %119 
                                bool %121 = OpLoad %115 
                              bool_2 %122 = OpCompositeConstruct %121 %121 
                               f32_2 %123 = OpSelect %122 %52 %55 
                                              OpStore %120 %123 
                        Private f32* %124 = OpAccessChain %120 %60 
                                 f32 %125 = OpLoad %124 
                        Private f32* %126 = OpAccessChain %106 %13 
                                 f32 %127 = OpLoad %126 
                                 f32 %128 = OpFMul %125 %127 
                                              OpStore %59 %128 
                                 f32 %129 = OpLoad %59 
                                 f32 %130 = OpExtInst %1 10 %129 
                                              OpStore %59 %130 
                        Private f32* %131 = OpAccessChain %120 %13 
                                 f32 %132 = OpLoad %131 
                                 f32 %133 = OpFNegate %132 
                                 f32 %134 = OpLoad %59 
                                 f32 %135 = OpFMul %133 %134 
                        Private f32* %136 = OpAccessChain %9 %60 
                                 f32 %137 = OpLoad %136 
                                 f32 %138 = OpFAdd %135 %137 
                                              OpStore %59 %138 
                        Private f32* %139 = OpAccessChain %9 %60 
                                 f32 %140 = OpLoad %139 
                                 f32 %141 = OpFNegate %140 
                        Uniform f32* %142 = OpAccessChain %20 %22 %60 
                                 f32 %143 = OpLoad %142 
                                 f32 %144 = OpFMul %141 %143 
                        Private f32* %145 = OpAccessChain %33 %13 
                                 f32 %146 = OpLoad %145 
                                 f32 %147 = OpFAdd %144 %146 
                        Private f32* %148 = OpAccessChain %33 %13 
                                              OpStore %148 %147 
                      Uniform f32_4* %150 = OpAccessChain %20 %22 
                               f32_4 %151 = OpLoad %150 
                               f32_2 %152 = OpVectorShuffle %151 %151 1 0 
                               f32_2 %155 = OpFMul %152 %154 
                                              OpStore %120 %155 
                        Private f32* %157 = OpAccessChain %120 %13 
                                 f32 %158 = OpLoad %157 
                        Private f32* %159 = OpAccessChain %33 %13 
                                 f32 %160 = OpLoad %159 
                                bool %161 = OpFOrdLessThan %158 %160 
                                              OpStore %156 %161 
                        Private f32* %162 = OpAccessChain %33 %13 
                                 f32 %163 = OpLoad %162 
                        Uniform f32* %164 = OpAccessChain %20 %22 %60 
                                 f32 %165 = OpLoad %164 
                                 f32 %166 = OpFDiv %163 %165 
                        Private f32* %167 = OpAccessChain %33 %13 
                                              OpStore %167 %166 
                        Private f32* %168 = OpAccessChain %33 %13 
                                 f32 %169 = OpLoad %168 
                                 f32 %170 = OpFNegate %169 
                                 f32 %171 = OpFAdd %170 %51 
                        Private f32* %172 = OpAccessChain %33 %13 
                                              OpStore %172 %171 
                        Private f32* %173 = OpAccessChain %33 %13 
                                 f32 %174 = OpLoad %173 
                                 f32 %175 = OpExtInst %1 4 %174 
                        Private f32* %176 = OpAccessChain %120 %60 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpFMul %175 %177 
                        Private f32* %179 = OpAccessChain %33 %13 
                                              OpStore %179 %178 
                                bool %180 = OpLoad %156 
                                 f32 %182 = OpSelect %180 %87 %181 
                        Private f32* %183 = OpAccessChain %120 %13 
                                              OpStore %183 %182 
                                 f32 %184 = OpLoad %59 
                        Private f32* %185 = OpAccessChain %120 %13 
                                 f32 %186 = OpLoad %185 
                                 f32 %187 = OpFAdd %184 %186 
                        Private f32* %188 = OpAccessChain %106 %60 
                                              OpStore %188 %187 
                        Private f32* %189 = OpAccessChain %9 %13 
                                 f32 %190 = OpLoad %189 
                                 f32 %191 = OpFNegate %190 
                        Uniform f32* %192 = OpAccessChain %20 %22 %13 
                                 f32 %193 = OpLoad %192 
                                 f32 %194 = OpFMul %191 %193 
                          Input f32* %195 = OpAccessChain vs_TEXCOORD1 %13 
                                 f32 %196 = OpLoad %195 
                                 f32 %197 = OpFAdd %194 %196 
                                              OpStore %59 %197 
                        Private f32* %198 = OpAccessChain %33 %13 
                                 f32 %199 = OpLoad %198 
                                 f32 %200 = OpLoad %59 
                                bool %201 = OpFOrdLessThan %199 %200 
                                              OpStore %42 %201 
                                bool %202 = OpLoad %42 
                                              OpSelectionMerge %206 None 
                                              OpBranchConditional %202 %205 %208 
                                     %205 = OpLabel 
                               f32_2 %207 = OpLoad %9 
                                              OpStore %204 %207 
                                              OpBranch %206 
                                     %208 = OpLabel 
                               f32_2 %209 = OpLoad %106 
                                              OpStore %204 %209 
                                              OpBranch %206 
                                     %206 = OpLabel 
                               f32_2 %210 = OpLoad %204 
                                              OpStore %9 %210 
                        Private f32* %211 = OpAccessChain %9 %13 
                                 f32 %212 = OpLoad %211 
                        Private f32* %213 = OpAccessChain %9 %13 
                                 f32 %214 = OpLoad %213 
                                 f32 %215 = OpFAdd %212 %214 
                        Private f32* %216 = OpAccessChain %33 %13 
                                              OpStore %216 %215 
                        Private f32* %217 = OpAccessChain %33 %13 
                                 f32 %218 = OpLoad %217 
                        Private f32* %219 = OpAccessChain %33 %13 
                                 f32 %220 = OpLoad %219 
                                 f32 %221 = OpFNegate %220 
                                bool %222 = OpFOrdGreaterThanEqual %218 %221 
                                              OpStore %42 %222 
                                bool %223 = OpLoad %42 
                              bool_2 %224 = OpCompositeConstruct %223 %223 
                               f32_2 %225 = OpSelect %224 %52 %55 
                                              OpStore %33 %225 
                        Private f32* %226 = OpAccessChain %33 %60 
                                 f32 %227 = OpLoad %226 
                        Private f32* %228 = OpAccessChain %9 %13 
                                 f32 %229 = OpLoad %228 
                                 f32 %230 = OpFMul %227 %229 
                                              OpStore %59 %230 
                                 f32 %231 = OpLoad %59 
                                 f32 %232 = OpExtInst %1 10 %231 
                                              OpStore %59 %232 
                                 f32 %233 = OpLoad %59 
                        Private f32* %234 = OpAccessChain %33 %13 
                                 f32 %235 = OpLoad %234 
                                 f32 %236 = OpFMul %233 %235 
                        Private f32* %237 = OpAccessChain %33 %13 
                                              OpStore %237 %236 
                        Private f32* %238 = OpAccessChain %33 %13 
                                 f32 %239 = OpLoad %238 
                        Uniform f32* %240 = OpAccessChain %20 %22 %60 
                                 f32 %241 = OpLoad %240 
                                 f32 %242 = OpFMul %239 %241 
                        Private f32* %243 = OpAccessChain %33 %13 
                                              OpStore %243 %242 
                        Private f32* %244 = OpAccessChain %33 %13 
                                 f32 %245 = OpLoad %244 
                                 f32 %246 = OpFMul %245 %51 
                        Private f32* %247 = OpAccessChain %33 %13 
                                              OpStore %247 %246 
                        Private f32* %249 = OpAccessChain %9 %60 
                                 f32 %250 = OpLoad %249 
                                 f32 %251 = OpExtInst %1 3 %250 
                                              OpStore %248 %251 
                        Private f32* %252 = OpAccessChain %9 %13 
                                 f32 %253 = OpLoad %252 
                        Uniform f32* %254 = OpAccessChain %20 %22 %13 
                                 f32 %255 = OpLoad %254 
                                 f32 %256 = OpFMul %253 %255 
                        Private f32* %257 = OpAccessChain %106 %13 
                                              OpStore %257 %256 
                                 f32 %258 = OpLoad %248 
                        Uniform f32* %259 = OpAccessChain %20 %22 %60 
                                 f32 %260 = OpLoad %259 
                                 f32 %261 = OpFMul %258 %260 
                        Private f32* %262 = OpAccessChain %33 %13 
                                 f32 %263 = OpLoad %262 
                                 f32 %264 = OpFAdd %261 %263 
                        Private f32* %265 = OpAccessChain %106 %60 
                                              OpStore %265 %264 
                 read_only Texture2D %271 = OpLoad %270 
                             sampler %275 = OpLoad %274 
          read_only Texture2DSampled %277 = OpSampledImage %271 %275 
                               f32_2 %278 = OpLoad %106 
                               f32_4 %279 = OpImageSampleImplicitLod %277 %278 
                                              OpStore %267 %279 
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
 Pass {
  Name "Mosaic: Circle"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 149499
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _ScreenParams.yx / _ScreenParams.xy;
    u_xlat1.x = vs_TEXCOORD1.x / u_xlat0.x;
    u_xlat1.y = vs_TEXCOORD1.y;
    u_xlat0.xz = u_xlat1.xy * _Params.xx;
    u_xlat0.xz = floor(u_xlat0.xz);
    u_xlat9 = float(1.0) / _Params.x;
    u_xlat7 = u_xlat9 * 0.5;
    u_xlat2.yz = u_xlat0.xz * vec2(u_xlat9) + vec2(u_xlat7);
    u_xlat0.xz = u_xlat1.xy + (-u_xlat2.yz);
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Params.x;
    u_xlatb0 = 0.449999988<u_xlat0.x;
    u_xlat2.x = u_xlat2.y / u_xlat0.y;
    u_xlat1 = texture(_MainTex, u_xlat2.xz);
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %30 %131 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD1 Location 30 
                                              OpDecorate %119 DescriptorSet 119 
                                              OpDecorate %119 Binding 119 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %131 Location 131 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %10 %10 
                                      %12 = OpTypePointer Uniform %11 
      Uniform struct {f32_4; f32_4;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypeVector %6 2 
                                      %17 = OpTypePointer Uniform %10 
                                      %27 = OpTypePointer Private %10 
                       Private f32_4* %28 = OpVariable Private 
                                      %29 = OpTypePointer Input %16 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                      %31 = OpTypeInt 32 0 
                                  u32 %32 = OpConstant 0 
                                      %33 = OpTypePointer Input %6 
                                      %36 = OpTypePointer Private %6 
                                  u32 %41 = OpConstant 1 
                                  i32 %47 = OpConstant 1 
                         Private f32* %59 = OpVariable Private 
                                  f32 %60 = OpConstant 3.674022E-40 
                                      %61 = OpTypePointer Uniform %6 
                         Private f32* %65 = OpVariable Private 
                                  f32 %67 = OpConstant 3.674022E-40 
                       Private f32_3* %69 = OpVariable Private 
                                     %104 = OpTypeBool 
                                     %105 = OpTypePointer Private %104 
                       Private bool* %106 = OpVariable Private 
                                 f32 %107 = OpConstant 3.674022E-40 
                                     %117 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %118 = OpTypePointer UniformConstant %117 
UniformConstant read_only Texture2D* %119 = OpVariable UniformConstant 
                                     %121 = OpTypeSampler 
                                     %122 = OpTypePointer UniformConstant %121 
            UniformConstant sampler* %123 = OpVariable UniformConstant 
                                     %125 = OpTypeSampledImage %117 
                                     %130 = OpTypePointer Output %10 
                       Output f32_4* %131 = OpVariable Output 
                                 f32 %133 = OpConstant 3.674022E-40 
                               f32_4 %134 = OpConstantComposite %133 %133 %133 %133 
                                     %136 = OpTypeVector %104 4 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Uniform f32_4* %18 = OpAccessChain %13 %15 
                                f32_4 %19 = OpLoad %18 
                                f32_2 %20 = OpVectorShuffle %19 %19 1 0 
                       Uniform f32_4* %21 = OpAccessChain %13 %15 
                                f32_4 %22 = OpLoad %21 
                                f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                f32_2 %24 = OpFDiv %20 %23 
                                f32_3 %25 = OpLoad %9 
                                f32_3 %26 = OpVectorShuffle %25 %24 3 4 2 
                                              OpStore %9 %26 
                           Input f32* %34 = OpAccessChain vs_TEXCOORD1 %32 
                                  f32 %35 = OpLoad %34 
                         Private f32* %37 = OpAccessChain %9 %32 
                                  f32 %38 = OpLoad %37 
                                  f32 %39 = OpFDiv %35 %38 
                         Private f32* %40 = OpAccessChain %28 %32 
                                              OpStore %40 %39 
                           Input f32* %42 = OpAccessChain vs_TEXCOORD1 %41 
                                  f32 %43 = OpLoad %42 
                         Private f32* %44 = OpAccessChain %28 %41 
                                              OpStore %44 %43 
                                f32_4 %45 = OpLoad %28 
                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                       Uniform f32_4* %48 = OpAccessChain %13 %47 
                                f32_4 %49 = OpLoad %48 
                                f32_2 %50 = OpVectorShuffle %49 %49 0 0 
                                f32_2 %51 = OpFMul %46 %50 
                                f32_3 %52 = OpLoad %9 
                                f32_3 %53 = OpVectorShuffle %52 %51 3 1 4 
                                              OpStore %9 %53 
                                f32_3 %54 = OpLoad %9 
                                f32_2 %55 = OpVectorShuffle %54 %54 0 2 
                                f32_2 %56 = OpExtInst %1 8 %55 
                                f32_3 %57 = OpLoad %9 
                                f32_3 %58 = OpVectorShuffle %57 %56 3 1 4 
                                              OpStore %9 %58 
                         Uniform f32* %62 = OpAccessChain %13 %47 %32 
                                  f32 %63 = OpLoad %62 
                                  f32 %64 = OpFDiv %60 %63 
                                              OpStore %59 %64 
                                  f32 %66 = OpLoad %59 
                                  f32 %68 = OpFMul %66 %67 
                                              OpStore %65 %68 
                                f32_3 %70 = OpLoad %9 
                                f32_2 %71 = OpVectorShuffle %70 %70 0 2 
                                  f32 %72 = OpLoad %59 
                                f32_2 %73 = OpCompositeConstruct %72 %72 
                                f32_2 %74 = OpFMul %71 %73 
                                  f32 %75 = OpLoad %65 
                                f32_2 %76 = OpCompositeConstruct %75 %75 
                                f32_2 %77 = OpFAdd %74 %76 
                                f32_3 %78 = OpLoad %69 
                                f32_3 %79 = OpVectorShuffle %78 %77 0 3 4 
                                              OpStore %69 %79 
                                f32_4 %80 = OpLoad %28 
                                f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                                f32_3 %82 = OpLoad %69 
                                f32_2 %83 = OpVectorShuffle %82 %82 1 2 
                                f32_2 %84 = OpFNegate %83 
                                f32_2 %85 = OpFAdd %81 %84 
                                f32_3 %86 = OpLoad %9 
                                f32_3 %87 = OpVectorShuffle %86 %85 3 1 4 
                                              OpStore %9 %87 
                                f32_3 %88 = OpLoad %9 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 2 
                                f32_3 %90 = OpLoad %9 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 2 
                                  f32 %92 = OpDot %89 %91 
                         Private f32* %93 = OpAccessChain %9 %32 
                                              OpStore %93 %92 
                         Private f32* %94 = OpAccessChain %9 %32 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpExtInst %1 31 %95 
                         Private f32* %97 = OpAccessChain %9 %32 
                                              OpStore %97 %96 
                         Private f32* %98 = OpAccessChain %9 %32 
                                  f32 %99 = OpLoad %98 
                        Uniform f32* %100 = OpAccessChain %13 %47 %32 
                                 f32 %101 = OpLoad %100 
                                 f32 %102 = OpFMul %99 %101 
                        Private f32* %103 = OpAccessChain %9 %32 
                                              OpStore %103 %102 
                        Private f32* %108 = OpAccessChain %9 %32 
                                 f32 %109 = OpLoad %108 
                                bool %110 = OpFOrdLessThan %107 %109 
                                              OpStore %106 %110 
                        Private f32* %111 = OpAccessChain %69 %41 
                                 f32 %112 = OpLoad %111 
                        Private f32* %113 = OpAccessChain %9 %41 
                                 f32 %114 = OpLoad %113 
                                 f32 %115 = OpFDiv %112 %114 
                        Private f32* %116 = OpAccessChain %69 %32 
                                              OpStore %116 %115 
                 read_only Texture2D %120 = OpLoad %119 
                             sampler %124 = OpLoad %123 
          read_only Texture2DSampled %126 = OpSampledImage %120 %124 
                               f32_3 %127 = OpLoad %69 
                               f32_2 %128 = OpVectorShuffle %127 %127 0 2 
                               f32_4 %129 = OpImageSampleImplicitLod %126 %128 
                                              OpStore %28 %129 
                                bool %132 = OpLoad %106 
                               f32_4 %135 = OpLoad %28 
                              bool_4 %137 = OpCompositeConstruct %132 %132 %132 %132 
                               f32_4 %138 = OpSelect %137 %134 %135 
                                              OpStore %131 %138 
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