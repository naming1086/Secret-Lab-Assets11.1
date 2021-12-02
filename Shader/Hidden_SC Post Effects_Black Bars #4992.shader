//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Black Bars" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38626
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
uniform 	vec2 _Size;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0 = min(u_xlat0, vs_TEXCOORD0.y);
    u_xlat2 = _Size.y * _Size.x;
    u_xlatb0 = u_xlat0>=u_xlat2;
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 78
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %59 %63 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %25 0 Offset 25 
                                             OpDecorate %25 Block 
                                             OpDecorate %27 DescriptorSet 27 
                                             OpDecorate %27 Binding 27 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %55 DescriptorSet 55 
                                             OpDecorate %55 Binding 55 
                                             OpDecorate vs_TEXCOORD1 Location 59 
                                             OpDecorate %63 Location 63 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeVector %6 2 
                                     %10 = OpTypePointer Input %9 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %12 = OpTypeInt 32 0 
                                 u32 %13 = OpConstant 1 
                                     %14 = OpTypePointer Input %6 
                                 f32 %18 = OpConstant 3.674022E-40 
                        Private f32* %24 = OpVariable Private 
                                     %25 = OpTypeStruct %9 
                                     %26 = OpTypePointer Uniform %25 
            Uniform struct {f32_2;}* %27 = OpVariable Uniform 
                                     %28 = OpTypeInt 32 1 
                                 i32 %29 = OpConstant 0 
                                     %30 = OpTypePointer Uniform %6 
                                 u32 %33 = OpConstant 0 
                                     %37 = OpTypeBool 
                                     %38 = OpTypePointer Private %37 
                       Private bool* %39 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %46 = OpTypeVector %6 4 
                                     %47 = OpTypePointer Private %46 
                      Private f32_4* %48 = OpVariable Private 
                                     %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %50 = OpTypePointer UniformConstant %49 
UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                     %53 = OpTypeSampler 
                                     %54 = OpTypePointer UniformConstant %53 
            UniformConstant sampler* %55 = OpVariable UniformConstant 
                                     %57 = OpTypeSampledImage %49 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %62 = OpTypePointer Output %46 
                       Output f32_4* %63 = OpVariable Output 
                                     %65 = OpTypeVector %6 3 
                                 u32 %72 = OpConstant 3 
                                     %75 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                          Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                 f32 %16 = OpLoad %15 
                                 f32 %17 = OpFNegate %16 
                                 f32 %19 = OpFAdd %17 %18 
                                             OpStore %8 %19 
                                 f32 %20 = OpLoad %8 
                          Input f32* %21 = OpAccessChain vs_TEXCOORD0 %13 
                                 f32 %22 = OpLoad %21 
                                 f32 %23 = OpExtInst %1 37 %20 %22 
                                             OpStore %8 %23 
                        Uniform f32* %31 = OpAccessChain %27 %29 %13 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %34 = OpAccessChain %27 %29 %33 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %32 %35 
                                             OpStore %24 %36 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpLoad %24 
                                bool %42 = OpFOrdGreaterThanEqual %40 %41 
                                             OpStore %39 %42 
                                bool %43 = OpLoad %39 
                                 f32 %45 = OpSelect %43 %18 %44 
                                             OpStore %8 %45 
                 read_only Texture2D %52 = OpLoad %51 
                             sampler %56 = OpLoad %55 
          read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                               f32_2 %60 = OpLoad vs_TEXCOORD1 
                               f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                             OpStore %48 %61 
                                 f32 %64 = OpLoad %8 
                               f32_3 %66 = OpCompositeConstruct %64 %64 %64 
                               f32_4 %67 = OpLoad %48 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_3 %69 = OpFMul %66 %68 
                               f32_4 %70 = OpLoad %63 
                               f32_4 %71 = OpVectorShuffle %70 %69 4 5 6 3 
                                             OpStore %63 %71 
                        Private f32* %73 = OpAccessChain %48 %72 
                                 f32 %74 = OpLoad %73 
                         Output f32* %76 = OpAccessChain %63 %72 
                                             OpStore %76 %74 
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 121070
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
uniform 	vec2 _Size;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat0 = u_xlat0 * vs_TEXCOORD0.x;
    u_xlat2 = _Size.x * _Size.y;
    u_xlat2 = u_xlat2 * 0.5;
    u_xlatb0 = u_xlat0>=u_xlat2;
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 81
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %62 %66 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %25 0 Offset 25 
                                             OpDecorate %25 Block 
                                             OpDecorate %27 DescriptorSet 27 
                                             OpDecorate %27 Binding 27 
                                             OpDecorate %54 DescriptorSet 54 
                                             OpDecorate %54 Binding 54 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate vs_TEXCOORD1 Location 62 
                                             OpDecorate %66 Location 66 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeVector %6 2 
                                     %10 = OpTypePointer Input %9 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %12 = OpTypeInt 32 0 
                                 u32 %13 = OpConstant 0 
                                     %14 = OpTypePointer Input %6 
                                 f32 %18 = OpConstant 3.674022E-40 
                        Private f32* %24 = OpVariable Private 
                                     %25 = OpTypeStruct %9 
                                     %26 = OpTypePointer Uniform %25 
            Uniform struct {f32_2;}* %27 = OpVariable Uniform 
                                     %28 = OpTypeInt 32 1 
                                 i32 %29 = OpConstant 0 
                                     %30 = OpTypePointer Uniform %6 
                                 u32 %33 = OpConstant 1 
                                 f32 %38 = OpConstant 3.674022E-40 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypeVector %6 4 
                                     %50 = OpTypePointer Private %49 
                      Private f32_4* %51 = OpVariable Private 
                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %53 = OpTypePointer UniformConstant %52 
UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
                                     %56 = OpTypeSampler 
                                     %57 = OpTypePointer UniformConstant %56 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
                                     %60 = OpTypeSampledImage %52 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %65 = OpTypePointer Output %49 
                       Output f32_4* %66 = OpVariable Output 
                                     %68 = OpTypeVector %6 3 
                                 u32 %75 = OpConstant 3 
                                     %78 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                          Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                 f32 %16 = OpLoad %15 
                                 f32 %17 = OpFNegate %16 
                                 f32 %19 = OpFAdd %17 %18 
                                             OpStore %8 %19 
                                 f32 %20 = OpLoad %8 
                          Input f32* %21 = OpAccessChain vs_TEXCOORD0 %13 
                                 f32 %22 = OpLoad %21 
                                 f32 %23 = OpFMul %20 %22 
                                             OpStore %8 %23 
                        Uniform f32* %31 = OpAccessChain %27 %29 %13 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %34 = OpAccessChain %27 %29 %33 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %32 %35 
                                             OpStore %24 %36 
                                 f32 %37 = OpLoad %24 
                                 f32 %39 = OpFMul %37 %38 
                                             OpStore %24 %39 
                                 f32 %43 = OpLoad %8 
                                 f32 %44 = OpLoad %24 
                                bool %45 = OpFOrdGreaterThanEqual %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 f32 %48 = OpSelect %46 %18 %47 
                                             OpStore %8 %48 
                 read_only Texture2D %55 = OpLoad %54 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
                               f32_2 %63 = OpLoad vs_TEXCOORD1 
                               f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                                             OpStore %51 %64 
                                 f32 %67 = OpLoad %8 
                               f32_3 %69 = OpCompositeConstruct %67 %67 %67 
                               f32_4 %70 = OpLoad %51 
                               f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                               f32_3 %72 = OpFMul %69 %71 
                               f32_4 %73 = OpLoad %66 
                               f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                             OpStore %66 %74 
                        Private f32* %76 = OpAccessChain %51 %75 
                                 f32 %77 = OpLoad %76 
                         Output f32* %79 = OpAccessChain %66 %75 
                                             OpStore %79 %77 
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