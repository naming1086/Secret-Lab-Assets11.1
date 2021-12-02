//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Lensflares" {
Properties {
}
SubShader {
 Pass {
  Name "Lens flares: Luminance mask"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 7358
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
uniform 	float _Threshold;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1 = max(u_xlat0.z, u_xlat1);
    u_xlat3 = u_xlat1 + (-_Threshold);
    u_xlat1 = max(u_xlat1, 0.00100000005);
    u_xlat3 = max(u_xlat3, 0.0);
    u_xlat1 = u_xlat3 / u_xlat1;
    u_xlat0 = u_xlat0 * vec4(u_xlat1);
    SV_Target0 = u_xlat0 * vec4(_Intensity);
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
; Bound: 74
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %66 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpMemberDecorate %42 0 Offset 42 
                                             OpMemberDecorate %42 1 Offset 42 
                                             OpDecorate %42 Block 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %66 Location 66 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 1 
                                 u32 %31 = OpConstant 0 
                                 u32 %35 = OpConstant 2 
                        Private f32* %40 = OpVariable Private 
                                     %42 = OpTypeStruct %6 %6 
                                     %43 = OpTypePointer Uniform %42 
         Uniform struct {f32; f32;}* %44 = OpVariable Uniform 
                                     %45 = OpTypeInt 32 1 
                                 i32 %46 = OpConstant 0 
                                     %47 = OpTypePointer Uniform %6 
                                 f32 %53 = OpConstant 3.674022E-40 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %65 = OpTypePointer Output %7 
                       Output f32_4* %66 = OpVariable Output 
                                 i32 %68 = OpConstant 1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                        Private f32* %32 = OpAccessChain %9 %31 
                                 f32 %33 = OpLoad %32 
                                 f32 %34 = OpExtInst %1 40 %30 %33 
                                             OpStore %26 %34 
                        Private f32* %36 = OpAccessChain %9 %35 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpLoad %26 
                                 f32 %39 = OpExtInst %1 40 %37 %38 
                                             OpStore %26 %39 
                                 f32 %41 = OpLoad %26 
                        Uniform f32* %48 = OpAccessChain %44 %46 
                                 f32 %49 = OpLoad %48 
                                 f32 %50 = OpFNegate %49 
                                 f32 %51 = OpFAdd %41 %50 
                                             OpStore %40 %51 
                                 f32 %52 = OpLoad %26 
                                 f32 %54 = OpExtInst %1 40 %52 %53 
                                             OpStore %26 %54 
                                 f32 %55 = OpLoad %40 
                                 f32 %57 = OpExtInst %1 40 %55 %56 
                                             OpStore %40 %57 
                                 f32 %58 = OpLoad %40 
                                 f32 %59 = OpLoad %26 
                                 f32 %60 = OpFDiv %58 %59 
                                             OpStore %26 %60 
                               f32_4 %61 = OpLoad %9 
                                 f32 %62 = OpLoad %26 
                               f32_4 %63 = OpCompositeConstruct %62 %62 %62 %62 
                               f32_4 %64 = OpFMul %61 %63 
                                             OpStore %9 %64 
                               f32_4 %67 = OpLoad %9 
                        Uniform f32* %69 = OpAccessChain %44 %68 
                                 f32 %70 = OpLoad %69 
                               f32_4 %71 = OpCompositeConstruct %70 %70 %70 %70 
                               f32_4 %72 = OpFMul %67 %71 
                                             OpStore %66 %72 
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
  Name "Lens flares: Ghosting"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 130442
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
uniform 	float _Distance;
uniform 	float _Falloff;
uniform 	float _Ghosts;
uniform 	float _HaloSize;
uniform 	float _HaloWidth;
UNITY_LOCATION(0) uniform  sampler2D _BloomTex;
UNITY_LOCATION(1) uniform  sampler2D _ColorTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec2 u_xlat8;
vec2 u_xlat9;
float u_xlat12;
int u_xlati12;
float u_xlat14;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = (-u_xlat8.x) * _Falloff + 1.0;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat9.xy = u_xlat1.xy * vec2(vec2(_Distance, _Distance));
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlati12 = 0;
    while(true){
        u_xlat14 = float(u_xlati12);
        u_xlatb3 = u_xlat14>=_Ghosts;
        if(u_xlatb3){break;}
        u_xlat3.xy = u_xlat9.xy * vec2(u_xlat14) + u_xlat0.xy;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat3 = texture(_BloomTex, u_xlat3.xy);
        u_xlat2.xyz = u_xlat3.xyz * u_xlat8.xxx + u_xlat2.xyz;
        u_xlati12 = u_xlati12 + 1;
    }
    u_xlat8.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = inversesqrt(u_xlat8.x);
    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy;
    u_xlat0.xy = u_xlat1.xy * vec2(vec2(_HaloSize, _HaloSize)) + u_xlat0.xy;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat1.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat8.xy = sqrt(u_xlat8.xy);
    u_xlat12 = (-u_xlat8.y) * _HaloWidth + 1.0;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1 = texture(_BloomTex, u_xlat0.xy);
    u_xlat0.xyw = u_xlat1.xxx * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat8.x = u_xlat8.x * 1.42857146;
    u_xlat1 = texture(_ColorTex, u_xlat8.xx);
    u_xlat1.xyz = u_xlat0.xyw * u_xlat1.xyz + (-u_xlat0.xyw);
    SV_Target0.xyz = u_xlat1.www * u_xlat1.xyz + u_xlat0.xyw;
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
; Bound: 282
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Fragment %4 "main" %12 %267 
                                                   OpExecutionMode %4 OriginUpperLeft 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate vs_TEXCOORD0 Location 12 
                                                   OpMemberDecorate %40 0 Offset 40 
                                                   OpMemberDecorate %40 1 Offset 40 
                                                   OpMemberDecorate %40 2 Offset 40 
                                                   OpMemberDecorate %40 3 Offset 40 
                                                   OpMemberDecorate %40 4 Offset 40 
                                                   OpDecorate %40 Block 
                                                   OpDecorate %42 DescriptorSet 42 
                                                   OpDecorate %42 Binding 42 
                                                   OpDecorate %126 DescriptorSet 126 
                                                   OpDecorate %126 Binding 126 
                                                   OpDecorate %130 DescriptorSet 130 
                                                   OpDecorate %130 Binding 130 
                                                   OpDecorate %247 DescriptorSet 247 
                                                   OpDecorate %247 Binding 247 
                                                   OpDecorate %249 DescriptorSet 249 
                                                   OpDecorate %249 Binding 249 
                                                   OpDecorate %267 Location 267 
                                            %2 = OpTypeVoid 
                                            %3 = OpTypeFunction %2 
                                            %6 = OpTypeFloat 32 
                                            %7 = OpTypeVector %6 4 
                                            %8 = OpTypePointer Private %7 
                             Private f32_4* %9 = OpVariable Private 
                                           %10 = OpTypeVector %6 2 
                                           %11 = OpTypePointer Input %10 
                     Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       f32 %15 = OpConstant 3.674022E-40 
                                     f32_2 %16 = OpConstantComposite %15 %15 
                                           %20 = OpTypePointer Private %10 
                            Private f32_2* %21 = OpVariable Private 
                                       f32 %24 = OpConstant 3.674022E-40 
                                     f32_2 %25 = OpConstantComposite %24 %24 
                                       f32 %27 = OpConstant 3.674022E-40 
                                     f32_2 %28 = OpConstantComposite %27 %27 
                                           %33 = OpTypeInt 32 0 
                                       u32 %34 = OpConstant 0 
                                           %35 = OpTypePointer Private %6 
                                           %40 = OpTypeStruct %6 %6 %6 %6 %6 
                                           %41 = OpTypePointer Uniform %40 
Uniform struct {f32; f32; f32; f32; f32;}* %42 = OpVariable Uniform 
                                           %43 = OpTypeInt 32 1 
                                       i32 %44 = OpConstant 1 
                                           %45 = OpTypePointer Uniform %6 
                                       f32 %53 = OpConstant 3.674022E-40 
                            Private f32_4* %56 = OpVariable Private 
                                       f32 %60 = OpConstant 3.674022E-40 
                                     f32_2 %61 = OpConstantComposite %60 %60 
                            Private f32_2* %65 = OpVariable Private 
                                       i32 %68 = OpConstant 0 
                                           %78 = OpTypeVector %6 3 
                                           %79 = OpTypePointer Private %78 
                            Private f32_3* %80 = OpVariable Private 
                                       u32 %82 = OpConstant 1 
                                       u32 %84 = OpConstant 2 
                                           %86 = OpTypePointer Private %43 
                              Private i32* %87 = OpVariable Private 
                                           %93 = OpTypeBool 
                                      bool %94 = OpConstantTrue 
                              Private f32* %95 = OpVariable Private 
                                           %98 = OpTypePointer Private %93 
                             Private bool* %99 = OpVariable Private 
                                      i32 %101 = OpConstant 2 
                           Private f32_3* %109 = OpVariable Private 
                                          %124 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %125 = OpTypePointer UniformConstant %124 
     UniformConstant read_only Texture2D* %126 = OpVariable UniformConstant 
                                          %128 = OpTypeSampler 
                                          %129 = OpTypePointer UniformConstant %128 
                 UniformConstant sampler* %130 = OpVariable UniformConstant 
                                          %132 = OpTypeSampledImage %124 
                             Private f32* %152 = OpVariable Private 
                                      i32 %165 = OpConstant 3 
                                      i32 %200 = OpConstant 4 
                                      f32 %244 = OpConstant 3.674022E-40 
     UniformConstant read_only Texture2D* %247 = OpVariable UniformConstant 
                 UniformConstant sampler* %249 = OpVariable UniformConstant 
                                          %266 = OpTypePointer Output %7 
                            Output f32_4* %267 = OpVariable Output 
                                      u32 %278 = OpConstant 3 
                                          %279 = OpTypePointer Output %6 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                                     f32_2 %13 = OpLoad vs_TEXCOORD0 
                                     f32_2 %14 = OpFNegate %13 
                                     f32_2 %17 = OpFAdd %14 %16 
                                     f32_4 %18 = OpLoad %9 
                                     f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                   OpStore %9 %19 
                                     f32_4 %22 = OpLoad %9 
                                     f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                     f32_2 %26 = OpFMul %23 %25 
                                     f32_2 %29 = OpFAdd %26 %28 
                                                   OpStore %21 %29 
                                     f32_2 %30 = OpLoad %21 
                                     f32_2 %31 = OpLoad %21 
                                       f32 %32 = OpDot %30 %31 
                              Private f32* %36 = OpAccessChain %21 %34 
                                                   OpStore %36 %32 
                              Private f32* %37 = OpAccessChain %21 %34 
                                       f32 %38 = OpLoad %37 
                                       f32 %39 = OpFNegate %38 
                              Uniform f32* %46 = OpAccessChain %42 %44 
                                       f32 %47 = OpLoad %46 
                                       f32 %48 = OpFMul %39 %47 
                                       f32 %49 = OpFAdd %48 %15 
                              Private f32* %50 = OpAccessChain %21 %34 
                                                   OpStore %50 %49 
                              Private f32* %51 = OpAccessChain %21 %34 
                                       f32 %52 = OpLoad %51 
                                       f32 %54 = OpExtInst %1 43 %52 %53 %15 
                              Private f32* %55 = OpAccessChain %21 %34 
                                                   OpStore %55 %54 
                                     f32_4 %57 = OpLoad %9 
                                     f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                                     f32_2 %59 = OpFNegate %58 
                                     f32_2 %62 = OpFAdd %59 %61 
                                     f32_4 %63 = OpLoad %56 
                                     f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                                   OpStore %56 %64 
                                     f32_4 %66 = OpLoad %56 
                                     f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                              Uniform f32* %69 = OpAccessChain %42 %68 
                                       f32 %70 = OpLoad %69 
                              Uniform f32* %71 = OpAccessChain %42 %68 
                                       f32 %72 = OpLoad %71 
                                     f32_2 %73 = OpCompositeConstruct %70 %72 
                                       f32 %74 = OpCompositeExtract %73 0 
                                       f32 %75 = OpCompositeExtract %73 1 
                                     f32_2 %76 = OpCompositeConstruct %74 %75 
                                     f32_2 %77 = OpFMul %67 %76 
                                                   OpStore %65 %77 
                              Private f32* %81 = OpAccessChain %80 %34 
                                                   OpStore %81 %53 
                              Private f32* %83 = OpAccessChain %80 %82 
                                                   OpStore %83 %53 
                              Private f32* %85 = OpAccessChain %80 %84 
                                                   OpStore %85 %53 
                                                   OpStore %87 %68 
                                                   OpBranch %88 
                                           %88 = OpLabel 
                                                   OpLoopMerge %90 %91 None 
                                                   OpBranch %92 
                                           %92 = OpLabel 
                                                   OpBranchConditional %94 %89 %90 
                                           %89 = OpLabel 
                                       i32 %96 = OpLoad %87 
                                       f32 %97 = OpConvertSToF %96 
                                                   OpStore %95 %97 
                                      f32 %100 = OpLoad %95 
                             Uniform f32* %102 = OpAccessChain %42 %101 
                                      f32 %103 = OpLoad %102 
                                     bool %104 = OpFOrdGreaterThanEqual %100 %103 
                                                   OpStore %99 %104 
                                     bool %105 = OpLoad %99 
                                                   OpSelectionMerge %107 None 
                                                   OpBranchConditional %105 %106 %107 
                                          %106 = OpLabel 
                                                   OpBranch %90 
                                          %107 = OpLabel 
                                    f32_2 %110 = OpLoad %65 
                                      f32 %111 = OpLoad %95 
                                    f32_2 %112 = OpCompositeConstruct %111 %111 
                                    f32_2 %113 = OpFMul %110 %112 
                                    f32_4 %114 = OpLoad %9 
                                    f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                    f32_2 %116 = OpFAdd %113 %115 
                                    f32_3 %117 = OpLoad %109 
                                    f32_3 %118 = OpVectorShuffle %117 %116 3 4 2 
                                                   OpStore %109 %118 
                                    f32_3 %119 = OpLoad %109 
                                    f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                    f32_2 %121 = OpExtInst %1 10 %120 
                                    f32_3 %122 = OpLoad %109 
                                    f32_3 %123 = OpVectorShuffle %122 %121 3 4 2 
                                                   OpStore %109 %123 
                      read_only Texture2D %127 = OpLoad %126 
                                  sampler %131 = OpLoad %130 
               read_only Texture2DSampled %133 = OpSampledImage %127 %131 
                                    f32_3 %134 = OpLoad %109 
                                    f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                    f32_4 %136 = OpImageSampleImplicitLod %133 %135 
                                    f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                                   OpStore %109 %137 
                                    f32_3 %138 = OpLoad %109 
                                    f32_2 %139 = OpLoad %21 
                                    f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                    f32_3 %141 = OpFMul %138 %140 
                                    f32_3 %142 = OpLoad %80 
                                    f32_3 %143 = OpFAdd %141 %142 
                                                   OpStore %80 %143 
                                      i32 %144 = OpLoad %87 
                                      i32 %145 = OpIAdd %144 %44 
                                                   OpStore %87 %145 
                                                   OpBranch %91 
                                           %91 = OpLabel 
                                                   OpBranch %88 
                                           %90 = OpLabel 
                                    f32_4 %146 = OpLoad %56 
                                    f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                    f32_4 %148 = OpLoad %56 
                                    f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                      f32 %150 = OpDot %147 %149 
                             Private f32* %151 = OpAccessChain %21 %34 
                                                   OpStore %151 %150 
                             Private f32* %153 = OpAccessChain %21 %34 
                                      f32 %154 = OpLoad %153 
                                      f32 %155 = OpExtInst %1 32 %154 
                                                   OpStore %152 %155 
                                      f32 %156 = OpLoad %152 
                                    f32_2 %157 = OpCompositeConstruct %156 %156 
                                    f32_4 %158 = OpLoad %56 
                                    f32_2 %159 = OpVectorShuffle %158 %158 0 1 
                                    f32_2 %160 = OpFMul %157 %159 
                                    f32_4 %161 = OpLoad %56 
                                    f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                   OpStore %56 %162 
                                    f32_4 %163 = OpLoad %56 
                                    f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                             Uniform f32* %166 = OpAccessChain %42 %165 
                                      f32 %167 = OpLoad %166 
                             Uniform f32* %168 = OpAccessChain %42 %165 
                                      f32 %169 = OpLoad %168 
                                    f32_2 %170 = OpCompositeConstruct %167 %169 
                                      f32 %171 = OpCompositeExtract %170 0 
                                      f32 %172 = OpCompositeExtract %170 1 
                                    f32_2 %173 = OpCompositeConstruct %171 %172 
                                    f32_2 %174 = OpFMul %164 %173 
                                    f32_4 %175 = OpLoad %9 
                                    f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                    f32_2 %177 = OpFAdd %174 %176 
                                    f32_4 %178 = OpLoad %9 
                                    f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                   OpStore %9 %179 
                                    f32_4 %180 = OpLoad %9 
                                    f32_2 %181 = OpVectorShuffle %180 %180 0 1 
                                    f32_2 %182 = OpExtInst %1 10 %181 
                                    f32_4 %183 = OpLoad %56 
                                    f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
                                                   OpStore %56 %184 
                                    f32_4 %185 = OpLoad %56 
                                    f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                    f32_2 %187 = OpFNegate %186 
                                    f32_2 %188 = OpFAdd %187 %61 
                                    f32_4 %189 = OpLoad %56 
                                    f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 3 
                                                   OpStore %56 %190 
                                    f32_4 %191 = OpLoad %56 
                                    f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                    f32_4 %193 = OpLoad %56 
                                    f32_2 %194 = OpVectorShuffle %193 %193 0 1 
                                      f32 %195 = OpDot %192 %194 
                                                   OpStore %152 %195 
                                      f32 %196 = OpLoad %152 
                                      f32 %197 = OpExtInst %1 31 %196 
                                                   OpStore %152 %197 
                                      f32 %198 = OpLoad %152 
                                      f32 %199 = OpFNegate %198 
                             Uniform f32* %201 = OpAccessChain %42 %200 
                                      f32 %202 = OpLoad %201 
                                      f32 %203 = OpFMul %199 %202 
                                      f32 %204 = OpFAdd %203 %15 
                                                   OpStore %152 %204 
                                      f32 %205 = OpLoad %152 
                                      f32 %206 = OpLoad %152 
                                      f32 %207 = OpFMul %205 %206 
                             Private f32* %208 = OpAccessChain %56 %34 
                                                   OpStore %208 %207 
                             Private f32* %209 = OpAccessChain %56 %34 
                                      f32 %210 = OpLoad %209 
                             Private f32* %211 = OpAccessChain %56 %34 
                                      f32 %212 = OpLoad %211 
                                      f32 %213 = OpFMul %210 %212 
                             Private f32* %214 = OpAccessChain %56 %34 
                                                   OpStore %214 %213 
                                      f32 %215 = OpLoad %152 
                             Private f32* %216 = OpAccessChain %56 %34 
                                      f32 %217 = OpLoad %216 
                                      f32 %218 = OpFMul %215 %217 
                                                   OpStore %152 %218 
                                      f32 %219 = OpLoad %152 
                                      f32 %220 = OpExtInst %1 43 %219 %53 %15 
                                                   OpStore %152 %220 
                      read_only Texture2D %221 = OpLoad %126 
                                  sampler %222 = OpLoad %130 
               read_only Texture2DSampled %223 = OpSampledImage %221 %222 
                                    f32_4 %224 = OpLoad %9 
                                    f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                    f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                      f32 %227 = OpCompositeExtract %226 0 
                             Private f32* %228 = OpAccessChain %9 %34 
                                                   OpStore %228 %227 
                                    f32_4 %229 = OpLoad %9 
                                    f32_3 %230 = OpVectorShuffle %229 %229 0 0 0 
                                      f32 %231 = OpLoad %152 
                                    f32_3 %232 = OpCompositeConstruct %231 %231 %231 
                                    f32_3 %233 = OpFMul %230 %232 
                                    f32_3 %234 = OpLoad %80 
                                    f32_3 %235 = OpFAdd %233 %234 
                                    f32_4 %236 = OpLoad %9 
                                    f32_4 %237 = OpVectorShuffle %236 %235 4 5 2 6 
                                                   OpStore %9 %237 
                             Private f32* %238 = OpAccessChain %21 %34 
                                      f32 %239 = OpLoad %238 
                                      f32 %240 = OpExtInst %1 31 %239 
                             Private f32* %241 = OpAccessChain %21 %34 
                                                   OpStore %241 %240 
                             Private f32* %242 = OpAccessChain %21 %34 
                                      f32 %243 = OpLoad %242 
                                      f32 %245 = OpFMul %243 %244 
                             Private f32* %246 = OpAccessChain %21 %34 
                                                   OpStore %246 %245 
                      read_only Texture2D %248 = OpLoad %247 
                                  sampler %250 = OpLoad %249 
               read_only Texture2DSampled %251 = OpSampledImage %248 %250 
                                    f32_2 %252 = OpLoad %21 
                                    f32_2 %253 = OpVectorShuffle %252 %252 0 0 
                                    f32_4 %254 = OpImageSampleImplicitLod %251 %253 
                                                   OpStore %56 %254 
                                    f32_4 %255 = OpLoad %9 
                                    f32_3 %256 = OpVectorShuffle %255 %255 0 1 3 
                                    f32_4 %257 = OpLoad %56 
                                    f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                    f32_3 %259 = OpFMul %256 %258 
                                    f32_4 %260 = OpLoad %9 
                                    f32_3 %261 = OpVectorShuffle %260 %260 0 1 3 
                                    f32_3 %262 = OpFNegate %261 
                                    f32_3 %263 = OpFAdd %259 %262 
                                    f32_4 %264 = OpLoad %56 
                                    f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                   OpStore %56 %265 
                                    f32_4 %268 = OpLoad %56 
                                    f32_3 %269 = OpVectorShuffle %268 %268 3 3 3 
                                    f32_4 %270 = OpLoad %56 
                                    f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                    f32_3 %272 = OpFMul %269 %271 
                                    f32_4 %273 = OpLoad %9 
                                    f32_3 %274 = OpVectorShuffle %273 %273 0 1 3 
                                    f32_3 %275 = OpFAdd %272 %274 
                                    f32_4 %276 = OpLoad %267 
                                    f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                   OpStore %267 %277 
                              Output f32* %280 = OpAccessChain %267 %278 
                                                   OpStore %280 %15 
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
  Name "Lens flares: Blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 133324
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
uniform 	vec4 _BlurOffsets;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _BlurOffsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + u_xlat0.xyxy;
    vs_TEXCOORD2 = _BlurOffsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + u_xlat0.xyxy;
    vs_TEXCOORD3 = _BlurOffsets.xyxy * vec4(6.0, 6.0, -6.0, -6.0) + u_xlat0.xyxy;
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
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.zw);
    u_xlat0 = u_xlat1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.zw);
    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.zw);
    SV_Target0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 96
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %54 %56 %68 %79 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpMemberDecorate %45 0 Offset 45 
                                             OpMemberDecorate %45 1 Offset 45 
                                             OpDecorate %45 Block 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpDecorate vs_TEXCOORD0 Location 54 
                                             OpDecorate vs_TEXCOORD1 Location 56 
                                             OpDecorate vs_TEXCOORD2 Location 68 
                                             OpDecorate vs_TEXCOORD3 Location 79 
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
                                     %45 = OpTypeStruct %6 %7 
                                     %46 = OpTypePointer Uniform %45 
       Uniform struct {f32; f32_4;}* %47 = OpVariable Uniform 
                                     %48 = OpTypePointer Uniform %6 
                                     %53 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                 i32 %57 = OpConstant 1 
                                     %58 = OpTypePointer Uniform %7 
                                 f32 %62 = OpConstant 3.674022E-40 
                               f32_4 %63 = OpConstantComposite %27 %27 %62 %62 
              Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                 f32 %72 = OpConstant 3.674022E-40 
                                 f32 %73 = OpConstant 3.674022E-40 
                               f32_4 %74 = OpConstantComposite %72 %72 %73 %73 
              Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %84 = OpConstant 3.674022E-40 
                               f32_4 %85 = OpConstantComposite %83 %83 %84 %84 
                                     %90 = OpTypePointer Output %6 
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
                               f32_2 %44 = OpLoad %33 
                        Uniform f32* %49 = OpAccessChain %47 %15 
                                 f32 %50 = OpLoad %49 
                               f32_2 %51 = OpCompositeConstruct %50 %50 
                               f32_2 %52 = OpFMul %44 %51 
                                             OpStore %33 %52 
                               f32_2 %55 = OpLoad %33 
                                             OpStore vs_TEXCOORD0 %55 
                      Uniform f32_4* %59 = OpAccessChain %47 %57 
                               f32_4 %60 = OpLoad %59 
                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
                               f32_4 %64 = OpFMul %61 %63 
                               f32_2 %65 = OpLoad %33 
                               f32_4 %66 = OpVectorShuffle %65 %65 0 1 0 1 
                               f32_4 %67 = OpFAdd %64 %66 
                                             OpStore vs_TEXCOORD1 %67 
                      Uniform f32_4* %69 = OpAccessChain %47 %57 
                               f32_4 %70 = OpLoad %69 
                               f32_4 %71 = OpVectorShuffle %70 %70 0 1 0 1 
                               f32_4 %75 = OpFMul %71 %74 
                               f32_2 %76 = OpLoad %33 
                               f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               f32_4 %78 = OpFAdd %75 %77 
                                             OpStore vs_TEXCOORD2 %78 
                      Uniform f32_4* %80 = OpAccessChain %47 %57 
                               f32_4 %81 = OpLoad %80 
                               f32_4 %82 = OpVectorShuffle %81 %81 0 1 0 1 
                               f32_4 %86 = OpFMul %82 %85 
                               f32_2 %87 = OpLoad %33 
                               f32_4 %88 = OpVectorShuffle %87 %87 0 1 0 1 
                               f32_4 %89 = OpFAdd %86 %88 
                                             OpStore vs_TEXCOORD3 %89 
                         Output f32* %91 = OpAccessChain %13 %15 %9 
                                 f32 %92 = OpLoad %91 
                                 f32 %93 = OpFNegate %92 
                         Output f32* %94 = OpAccessChain %13 %15 %9 
                                             OpStore %94 %93 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %35 %57 %80 %97 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 21 
                                             OpDecorate vs_TEXCOORD0 Location 35 
                                             OpDecorate vs_TEXCOORD2 Location 57 
                                             OpDecorate vs_TEXCOORD3 Location 80 
                                             OpDecorate %97 Location 97 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_4 %28 = OpConstantComposite %27 %27 %27 %27 
                      Private f32_4* %30 = OpVariable Private 
                                     %34 = OpTypePointer Input %22 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %39 = OpConstant 3.674022E-40 
                               f32_4 %40 = OpConstantComposite %39 %39 %39 %39 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %62 = OpConstant 3.674022E-40 
                               f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
               Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                 f32 %85 = OpConstant 3.674022E-40 
                               f32_4 %86 = OpConstantComposite %85 %85 %85 %85 
                                     %96 = OpTypePointer Output %7 
                       Output f32_4* %97 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD1 
                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                             OpStore %9 %25 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpFMul %26 %28 
                                             OpStore %9 %29 
                 read_only Texture2D %31 = OpLoad %12 
                             sampler %32 = OpLoad %16 
          read_only Texture2DSampled %33 = OpSampledImage %31 %32 
                               f32_2 %36 = OpLoad vs_TEXCOORD0 
                               f32_4 %37 = OpImageSampleImplicitLod %33 %36 
                                             OpStore %30 %37 
                               f32_4 %38 = OpLoad %30 
                               f32_4 %41 = OpFMul %38 %40 
                               f32_4 %42 = OpLoad %9 
                               f32_4 %43 = OpFAdd %41 %42 
                                             OpStore %9 %43 
                 read_only Texture2D %44 = OpLoad %12 
                             sampler %45 = OpLoad %16 
          read_only Texture2DSampled %46 = OpSampledImage %44 %45 
                               f32_4 %47 = OpLoad vs_TEXCOORD1 
                               f32_2 %48 = OpVectorShuffle %47 %47 2 3 
                               f32_4 %49 = OpImageSampleImplicitLod %46 %48 
                                             OpStore %30 %49 
                               f32_4 %50 = OpLoad %30 
                               f32_4 %51 = OpFMul %50 %28 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpFAdd %51 %52 
                                             OpStore %9 %53 
                 read_only Texture2D %54 = OpLoad %12 
                             sampler %55 = OpLoad %16 
          read_only Texture2DSampled %56 = OpSampledImage %54 %55 
                               f32_4 %58 = OpLoad vs_TEXCOORD2 
                               f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                               f32_4 %60 = OpImageSampleImplicitLod %56 %59 
                                             OpStore %30 %60 
                               f32_4 %61 = OpLoad %30 
                               f32_4 %64 = OpFMul %61 %63 
                               f32_4 %65 = OpLoad %9 
                               f32_4 %66 = OpFAdd %64 %65 
                                             OpStore %9 %66 
                 read_only Texture2D %67 = OpLoad %12 
                             sampler %68 = OpLoad %16 
          read_only Texture2DSampled %69 = OpSampledImage %67 %68 
                               f32_4 %70 = OpLoad vs_TEXCOORD2 
                               f32_2 %71 = OpVectorShuffle %70 %70 2 3 
                               f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                             OpStore %30 %72 
                               f32_4 %73 = OpLoad %30 
                               f32_4 %74 = OpFMul %73 %63 
                               f32_4 %75 = OpLoad %9 
                               f32_4 %76 = OpFAdd %74 %75 
                                             OpStore %9 %76 
                 read_only Texture2D %77 = OpLoad %12 
                             sampler %78 = OpLoad %16 
          read_only Texture2DSampled %79 = OpSampledImage %77 %78 
                               f32_4 %81 = OpLoad vs_TEXCOORD3 
                               f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                               f32_4 %83 = OpImageSampleImplicitLod %79 %82 
                                             OpStore %30 %83 
                               f32_4 %84 = OpLoad %30 
                               f32_4 %87 = OpFMul %84 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_4 %89 = OpFAdd %87 %88 
                                             OpStore %9 %89 
                 read_only Texture2D %90 = OpLoad %12 
                             sampler %91 = OpLoad %16 
          read_only Texture2DSampled %92 = OpSampledImage %90 %91 
                               f32_4 %93 = OpLoad vs_TEXCOORD3 
                               f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                               f32_4 %95 = OpImageSampleImplicitLod %92 %94 
                                             OpStore %30 %95 
                               f32_4 %98 = OpLoad %30 
                               f32_4 %99 = OpFMul %98 %86 
                              f32_4 %100 = OpLoad %9 
                              f32_4 %101 = OpFAdd %99 %100 
                                             OpStore %97 %101 
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
  Name "Lens flares: Composite"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 250771
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
uniform 	vec4 _FlaresTex_TexelSize;
uniform 	float _ChromaticAbberation;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FlaresTex;
UNITY_LOCATION(2) uniform  sampler2D _MaskTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
float u_xlat16;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlatb6 = 0.0<_ChromaticAbberation;
    if(u_xlatb6){
        u_xlat6.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
        u_xlat16 = dot(u_xlat6.xy, u_xlat6.xy);
        u_xlat16 = inversesqrt(u_xlat16);
        u_xlat6.xy = vec2(u_xlat16) * u_xlat6.xy;
        u_xlat16 = (-_FlaresTex_TexelSize.x) * _ChromaticAbberation;
        u_xlat2.x = _FlaresTex_TexelSize.x * _ChromaticAbberation;
        u_xlat7.xy = u_xlat6.xy * vec2(u_xlat16) + vs_TEXCOORD0.xy;
        u_xlat3 = texture(_FlaresTex, u_xlat7.xy);
        u_xlat4 = texture(_FlaresTex, vs_TEXCOORD0.xy);
        u_xlat6.xy = u_xlat6.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
        u_xlat2 = texture(_FlaresTex, u_xlat6.xy);
        u_xlat2.x = u_xlat3.x;
        u_xlat2.y = u_xlat4.y;
    } else {
        u_xlat2 = texture(_FlaresTex, vs_TEXCOORD0.xy);
    }
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 150
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %134 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %27 DescriptorSet 27 
                                             OpDecorate %27 Binding 27 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpMemberDecorate %41 0 Offset 41 
                                             OpMemberDecorate %41 1 Offset 41 
                                             OpDecorate %41 Block 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %94 DescriptorSet 94 
                                             OpDecorate %94 Binding 94 
                                             OpDecorate %127 DescriptorSet 127 
                                             OpDecorate %127 Binding 127 
                                             OpDecorate %134 Location 134 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %34 = OpTypeInt 32 0 
                                 u32 %35 = OpConstant 0 
                                     %37 = OpTypeBool 
                                     %38 = OpTypePointer Private %37 
                       Private bool* %39 = OpVariable Private 
                                 f32 %40 = OpConstant 3.674022E-40 
                                     %41 = OpTypeStruct %7 %6 
                                     %42 = OpTypePointer Uniform %41 
       Uniform struct {f32_4; f32;}* %43 = OpVariable Uniform 
                                     %44 = OpTypeInt 32 1 
                                 i32 %45 = OpConstant 1 
                                     %46 = OpTypePointer Uniform %6 
                                     %53 = OpTypePointer Private %20 
                      Private f32_2* %54 = OpVariable Private 
                                 f32 %57 = OpConstant 3.674022E-40 
                               f32_2 %58 = OpConstantComposite %57 %57 
                        Private f32* %60 = OpVariable Private 
                                 i32 %70 = OpConstant 0 
                        Private f32* %77 = OpVariable Private 
                                     %83 = OpTypeVector %6 3 
                                     %84 = OpTypePointer Private %83 
                      Private f32_3* %85 = OpVariable Private 
UniformConstant read_only Texture2D* %94 = OpVariable UniformConstant 
                                u32 %108 = OpConstant 1 
                                u32 %122 = OpConstant 2 
           UniformConstant sampler* %127 = OpVariable UniformConstant 
                                    %133 = OpTypePointer Output %7 
                      Output f32_4* %134 = OpVariable Output 
                                u32 %144 = OpConstant 3 
                                    %147 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %28 = OpLoad %27 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %31 = OpSampledImage %28 %30 
                               f32_2 %32 = OpLoad vs_TEXCOORD0 
                               f32_4 %33 = OpImageSampleImplicitLod %31 %32 
                                 f32 %36 = OpCompositeExtract %33 0 
                                             OpStore %26 %36 
                        Uniform f32* %47 = OpAccessChain %43 %45 
                                 f32 %48 = OpLoad %47 
                                bool %49 = OpFOrdLessThan %40 %48 
                                             OpStore %39 %49 
                                bool %50 = OpLoad %39 
                                             OpSelectionMerge %52 None 
                                             OpBranchConditional %50 %51 %125 
                                     %51 = OpLabel 
                               f32_2 %55 = OpLoad vs_TEXCOORD0 
                               f32_2 %56 = OpFNegate %55 
                               f32_2 %59 = OpFAdd %56 %58 
                                             OpStore %54 %59 
                               f32_2 %61 = OpLoad %54 
                               f32_2 %62 = OpLoad %54 
                                 f32 %63 = OpDot %61 %62 
                                             OpStore %60 %63 
                                 f32 %64 = OpLoad %60 
                                 f32 %65 = OpExtInst %1 32 %64 
                                             OpStore %60 %65 
                                 f32 %66 = OpLoad %60 
                               f32_2 %67 = OpCompositeConstruct %66 %66 
                               f32_2 %68 = OpLoad %54 
                               f32_2 %69 = OpFMul %67 %68 
                                             OpStore %54 %69 
                        Uniform f32* %71 = OpAccessChain %43 %70 %35 
                                 f32 %72 = OpLoad %71 
                                 f32 %73 = OpFNegate %72 
                        Uniform f32* %74 = OpAccessChain %43 %45 
                                 f32 %75 = OpLoad %74 
                                 f32 %76 = OpFMul %73 %75 
                                             OpStore %60 %76 
                        Uniform f32* %78 = OpAccessChain %43 %70 %35 
                                 f32 %79 = OpLoad %78 
                        Uniform f32* %80 = OpAccessChain %43 %45 
                                 f32 %81 = OpLoad %80 
                                 f32 %82 = OpFMul %79 %81 
                                             OpStore %77 %82 
                               f32_2 %86 = OpLoad %54 
                                 f32 %87 = OpLoad %60 
                               f32_2 %88 = OpCompositeConstruct %87 %87 
                               f32_2 %89 = OpFMul %86 %88 
                               f32_2 %90 = OpLoad vs_TEXCOORD0 
                               f32_2 %91 = OpFAdd %89 %90 
                               f32_3 %92 = OpLoad %85 
                               f32_3 %93 = OpVectorShuffle %92 %91 3 4 2 
                                             OpStore %85 %93 
                 read_only Texture2D %95 = OpLoad %94 
                             sampler %96 = OpLoad %29 
          read_only Texture2DSampled %97 = OpSampledImage %95 %96 
                               f32_3 %98 = OpLoad %85 
                               f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                              f32_4 %100 = OpImageSampleImplicitLod %97 %99 
                                f32 %101 = OpCompositeExtract %100 0 
                       Private f32* %102 = OpAccessChain %85 %35 
                                             OpStore %102 %101 
                read_only Texture2D %103 = OpLoad %94 
                            sampler %104 = OpLoad %29 
         read_only Texture2DSampled %105 = OpSampledImage %103 %104 
                              f32_2 %106 = OpLoad vs_TEXCOORD0 
                              f32_4 %107 = OpImageSampleImplicitLod %105 %106 
                                f32 %109 = OpCompositeExtract %107 1 
                       Private f32* %110 = OpAccessChain %85 %108 
                                             OpStore %110 %109 
                              f32_2 %111 = OpLoad %54 
                                f32 %112 = OpLoad %77 
                              f32_2 %113 = OpCompositeConstruct %112 %112 
                              f32_2 %114 = OpFMul %111 %113 
                              f32_2 %115 = OpLoad vs_TEXCOORD0 
                              f32_2 %116 = OpFAdd %114 %115 
                                             OpStore %54 %116 
                read_only Texture2D %117 = OpLoad %94 
                            sampler %118 = OpLoad %29 
         read_only Texture2DSampled %119 = OpSampledImage %117 %118 
                              f32_2 %120 = OpLoad %54 
                              f32_4 %121 = OpImageSampleImplicitLod %119 %120 
                                f32 %123 = OpCompositeExtract %121 2 
                       Private f32* %124 = OpAccessChain %85 %122 
                                             OpStore %124 %123 
                                             OpBranch %52 
                                    %125 = OpLabel 
                read_only Texture2D %126 = OpLoad %94 
                            sampler %128 = OpLoad %127 
         read_only Texture2DSampled %129 = OpSampledImage %126 %128 
                              f32_2 %130 = OpLoad vs_TEXCOORD0 
                              f32_4 %131 = OpImageSampleImplicitLod %129 %130 
                              f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                             OpStore %85 %132 
                                             OpBranch %52 
                                     %52 = OpLabel 
                              f32_3 %135 = OpLoad %85 
                                f32 %136 = OpLoad %26 
                              f32_3 %137 = OpCompositeConstruct %136 %136 %136 
                              f32_3 %138 = OpFMul %135 %137 
                              f32_4 %139 = OpLoad %9 
                              f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              f32_3 %141 = OpFAdd %138 %140 
                              f32_4 %142 = OpLoad %134 
                              f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                             OpStore %134 %143 
                       Private f32* %145 = OpAccessChain %9 %144 
                                f32 %146 = OpLoad %145 
                        Output f32* %148 = OpAccessChain %134 %144 
                                             OpStore %148 %146 
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
  Name "Lens flares: Debug"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 317132
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
uniform 	vec4 _FlaresTex_TexelSize;
uniform 	float _ChromaticAbberation;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FlaresTex;
UNITY_LOCATION(2) uniform  sampler2D _MaskTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat6;
float u_xlat10;
vec2 u_xlat11;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlatb0 = 0.0<_ChromaticAbberation;
    if(u_xlatb0){
        u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
        u_xlat10 = dot(u_xlat0.xy, u_xlat0.xy);
        u_xlat10 = inversesqrt(u_xlat10);
        u_xlat0.xy = vec2(u_xlat10) * u_xlat0.xy;
        u_xlat10 = (-_FlaresTex_TexelSize.x) * _ChromaticAbberation;
        u_xlat6 = _FlaresTex_TexelSize.x * _ChromaticAbberation;
        u_xlat11.xy = u_xlat0.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat2 = texture(_FlaresTex, u_xlat11.xy);
        u_xlat3 = texture(_FlaresTex, vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
        u_xlat4 = texture(_FlaresTex, u_xlat0.xy);
        u_xlat4.x = u_xlat2.x;
        u_xlat4.y = u_xlat3.y;
    } else {
        u_xlat4 = texture(_FlaresTex, vs_TEXCOORD0.xy);
    }
    SV_Target0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 150
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %138 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpMemberDecorate %41 0 Offset 41 
                                             OpMemberDecorate %41 1 Offset 41 
                                             OpDecorate %41 Block 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %96 DescriptorSet 96 
                                             OpDecorate %96 Binding 96 
                                             OpDecorate %138 Location 138 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                 u32 %35 = OpConstant 0 
                                     %37 = OpTypeBool 
                                     %38 = OpTypePointer Private %37 
                       Private bool* %39 = OpVariable Private 
                                 f32 %40 = OpConstant 3.674022E-40 
                                     %41 = OpTypeStruct %23 %6 
                                     %42 = OpTypePointer Uniform %41 
       Uniform struct {f32_4; f32;}* %43 = OpVariable Uniform 
                                     %44 = OpTypeInt 32 1 
                                 i32 %45 = OpConstant 1 
                                     %46 = OpTypePointer Uniform %6 
                                     %53 = OpTypePointer Private %19 
                      Private f32_2* %54 = OpVariable Private 
                                 f32 %57 = OpConstant 3.674022E-40 
                               f32_2 %58 = OpConstantComposite %57 %57 
                                     %60 = OpTypePointer Private %23 
                      Private f32_4* %61 = OpVariable Private 
                                 i32 %74 = OpConstant 0 
                        Private f32* %82 = OpVariable Private 
UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                                u32 %110 = OpConstant 1 
                                u32 %112 = OpConstant 2 
                                    %133 = OpTypeVector %6 3 
                                    %137 = OpTypePointer Output %23 
                      Output f32_4* %138 = OpVariable Output 
                                    %147 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %31 = OpLoad %15 
          read_only Texture2DSampled %32 = OpSampledImage %30 %31 
                               f32_2 %33 = OpLoad vs_TEXCOORD0 
                               f32_4 %34 = OpImageSampleImplicitLod %32 %33 
                                 f32 %36 = OpCompositeExtract %34 0 
                                             OpStore %28 %36 
                        Uniform f32* %47 = OpAccessChain %43 %45 
                                 f32 %48 = OpLoad %47 
                                bool %49 = OpFOrdLessThan %40 %48 
                                             OpStore %39 %49 
                                bool %50 = OpLoad %39 
                                             OpSelectionMerge %52 None 
                                             OpBranchConditional %50 %51 %127 
                                     %51 = OpLabel 
                               f32_2 %55 = OpLoad vs_TEXCOORD0 
                               f32_2 %56 = OpFNegate %55 
                               f32_2 %59 = OpFAdd %56 %58 
                                             OpStore %54 %59 
                               f32_2 %62 = OpLoad %54 
                               f32_2 %63 = OpLoad %54 
                                 f32 %64 = OpDot %62 %63 
                        Private f32* %65 = OpAccessChain %61 %35 
                                             OpStore %65 %64 
                        Private f32* %66 = OpAccessChain %61 %35 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpExtInst %1 32 %67 
                        Private f32* %69 = OpAccessChain %61 %35 
                                             OpStore %69 %68 
                               f32_2 %70 = OpLoad %54 
                               f32_4 %71 = OpLoad %61 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                               f32_2 %73 = OpFMul %70 %72 
                                             OpStore %54 %73 
                        Uniform f32* %75 = OpAccessChain %43 %74 %35 
                                 f32 %76 = OpLoad %75 
                                 f32 %77 = OpFNegate %76 
                        Uniform f32* %78 = OpAccessChain %43 %45 
                                 f32 %79 = OpLoad %78 
                                 f32 %80 = OpFMul %77 %79 
                        Private f32* %81 = OpAccessChain %61 %35 
                                             OpStore %81 %80 
                        Uniform f32* %83 = OpAccessChain %43 %74 %35 
                                 f32 %84 = OpLoad %83 
                        Uniform f32* %85 = OpAccessChain %43 %45 
                                 f32 %86 = OpLoad %85 
                                 f32 %87 = OpFMul %84 %86 
                                             OpStore %82 %87 
                               f32_2 %88 = OpLoad %54 
                               f32_4 %89 = OpLoad %61 
                               f32_2 %90 = OpVectorShuffle %89 %89 0 0 
                               f32_2 %91 = OpFMul %88 %90 
                               f32_2 %92 = OpLoad vs_TEXCOORD0 
                               f32_2 %93 = OpFAdd %91 %92 
                               f32_4 %94 = OpLoad %61 
                               f32_4 %95 = OpVectorShuffle %94 %93 4 1 5 3 
                                             OpStore %61 %95 
                 read_only Texture2D %97 = OpLoad %96 
                             sampler %98 = OpLoad %15 
          read_only Texture2DSampled %99 = OpSampledImage %97 %98 
                              f32_4 %100 = OpLoad %61 
                              f32_2 %101 = OpVectorShuffle %100 %100 0 2 
                              f32_4 %102 = OpImageSampleImplicitLod %99 %101 
                                f32 %103 = OpCompositeExtract %102 0 
                       Private f32* %104 = OpAccessChain %61 %35 
                                             OpStore %104 %103 
                read_only Texture2D %105 = OpLoad %96 
                            sampler %106 = OpLoad %15 
         read_only Texture2DSampled %107 = OpSampledImage %105 %106 
                              f32_2 %108 = OpLoad vs_TEXCOORD0 
                              f32_4 %109 = OpImageSampleImplicitLod %107 %108 
                                f32 %111 = OpCompositeExtract %109 1 
                       Private f32* %113 = OpAccessChain %61 %112 
                                             OpStore %113 %111 
                              f32_2 %114 = OpLoad %54 
                                f32 %115 = OpLoad %82 
                              f32_2 %116 = OpCompositeConstruct %115 %115 
                              f32_2 %117 = OpFMul %114 %116 
                              f32_2 %118 = OpLoad vs_TEXCOORD0 
                              f32_2 %119 = OpFAdd %117 %118 
                                             OpStore %54 %119 
                read_only Texture2D %120 = OpLoad %96 
                            sampler %121 = OpLoad %15 
         read_only Texture2DSampled %122 = OpSampledImage %120 %121 
                              f32_2 %123 = OpLoad %54 
                              f32_4 %124 = OpImageSampleImplicitLod %122 %123 
                                f32 %125 = OpCompositeExtract %124 2 
                       Private f32* %126 = OpAccessChain %61 %26 
                                             OpStore %126 %125 
                                             OpBranch %52 
                                    %127 = OpLabel 
                read_only Texture2D %128 = OpLoad %96 
                            sampler %129 = OpLoad %15 
         read_only Texture2DSampled %130 = OpSampledImage %128 %129 
                              f32_2 %131 = OpLoad vs_TEXCOORD0 
                              f32_4 %132 = OpImageSampleImplicitLod %130 %131 
                              f32_3 %134 = OpVectorShuffle %132 %132 0 1 2 
                              f32_4 %135 = OpLoad %61 
                              f32_4 %136 = OpVectorShuffle %135 %134 4 1 5 6 
                                             OpStore %61 %136 
                                             OpBranch %52 
                                     %52 = OpLabel 
                                f32 %139 = OpLoad %28 
                              f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                              f32_4 %141 = OpLoad %61 
                              f32_3 %142 = OpVectorShuffle %141 %141 0 2 3 
                              f32_3 %143 = OpFMul %140 %142 
                              f32_4 %144 = OpLoad %138 
                              f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                             OpStore %138 %145 
                                f32 %146 = OpLoad %8 
                        Output f32* %148 = OpAccessChain %138 %26 
                                             OpStore %148 %146 
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