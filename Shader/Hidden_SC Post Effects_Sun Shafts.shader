//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Sun Shafts" {
Properties {
}
SubShader {
 Pass {
  Name "Sunshafts sky mask"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 40596
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _SunThreshold;
uniform 	vec4 _SunPosition;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat4;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _SunPosition.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz + (-_SunThreshold.xyz);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat2.x = (-unity_OrthoParams.w) + 1.0;
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat4 = u_xlat1.x * _ZBufferParams.x;
    u_xlat2.x = u_xlat2.x * u_xlat4 + _ZBufferParams.y;
    u_xlat4 = (-unity_OrthoParams.w) * u_xlat4 + 1.0;
    u_xlat2.x = u_xlat4 / u_xlat2.x;
    u_xlatb2 = 0.99000001<u_xlat2.x;
    SV_Target0 = bool(u_xlatb2) ? u_xlat0.xxxx : vec4(0.0, 0.0, 0.0, 0.0);
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
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %134 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 DescriptorSet 60 
                                                      OpDecorate %60 Binding 60 
                                                      OpDecorate %94 DescriptorSet 94 
                                                      OpDecorate %94 Binding 94 
                                                      OpDecorate %134 Location 134 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %14 %14 %14 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %14 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 3 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %48 = OpConstant 3.674022E-40 
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Private %51 
                               Private f32_3* %53 = OpVariable Private 
                                              %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %55 = OpTypePointer UniformConstant %54 
         UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
                                              %58 = OpTypeSampler 
                                              %59 = OpTypePointer UniformConstant %58 
                     UniformConstant sampler* %60 = OpVariable UniformConstant 
                                              %62 = OpTypeSampledImage %54 
                                          i32 %68 = OpConstant 2 
                                        f32_3 %75 = OpConstantComposite %47 %47 %47 
                                        f32_3 %78 = OpConstantComposite %48 %48 %48 
                                          i32 %87 = OpConstant 0 
                                 Private f32* %93 = OpVariable Private 
         UniformConstant read_only Texture2D* %94 = OpVariable UniformConstant 
                                         i32 %102 = OpConstant 1 
                                         u32 %110 = OpConstant 1 
                                             %126 = OpTypeBool 
                                             %127 = OpTypePointer Private %126 
                               Private bool* %128 = OpVariable Private 
                                         f32 %129 = OpConstant 3.674022E-40 
                                             %133 = OpTypePointer Output %14 
                               Output f32_4* %134 = OpVariable Output 
                                             %136 = OpTypePointer Function %14 
                                       f32_4 %143 = OpConstantComposite %47 %47 %47 %47 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %137 = OpVariable Function 
                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
                                        f32_2 %13 = OpFNegate %12 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFAdd %13 %23 
                                                      OpStore %9 %24 
                                        f32_2 %25 = OpLoad %9 
                                        f32_2 %26 = OpLoad %9 
                                          f32 %27 = OpDot %25 %26 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %27 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %34 = OpExtInst %1 31 %33 
                                 Private f32* %35 = OpAccessChain %9 %29 
                                                      OpStore %35 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                 Uniform f32* %41 = OpAccessChain %17 %19 %39 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFAdd %38 %42 
                                 Private f32* %44 = OpAccessChain %9 %29 
                                                      OpStore %44 %43 
                                 Private f32* %45 = OpAccessChain %9 %29 
                                          f32 %46 = OpLoad %45 
                                          f32 %49 = OpExtInst %1 43 %46 %47 %48 
                                 Private f32* %50 = OpAccessChain %9 %29 
                                                      OpStore %50 %49 
                          read_only Texture2D %57 = OpLoad %56 
                                      sampler %61 = OpLoad %60 
                   read_only Texture2DSampled %63 = OpSampledImage %57 %61 
                                        f32_2 %64 = OpLoad vs_TEXCOORD0 
                                        f32_4 %65 = OpImageSampleImplicitLod %63 %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                                      OpStore %53 %66 
                                        f32_3 %67 = OpLoad %53 
                               Uniform f32_4* %69 = OpAccessChain %17 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                                        f32_3 %73 = OpFAdd %67 %72 
                                                      OpStore %53 %73 
                                        f32_3 %74 = OpLoad %53 
                                        f32_3 %76 = OpExtInst %1 40 %74 %75 
                                                      OpStore %53 %76 
                                        f32_3 %77 = OpLoad %53 
                                          f32 %79 = OpDot %77 %78 
                                 Private f32* %80 = OpAccessChain %53 %29 
                                                      OpStore %80 %79 
                                 Private f32* %81 = OpAccessChain %9 %29 
                                          f32 %82 = OpLoad %81 
                                 Private f32* %83 = OpAccessChain %53 %29 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFMul %82 %84 
                                 Private f32* %86 = OpAccessChain %9 %29 
                                                      OpStore %86 %85 
                                 Uniform f32* %88 = OpAccessChain %17 %87 %39 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %90 %48 
                                 Private f32* %92 = OpAccessChain %53 %29 
                                                      OpStore %92 %91 
                          read_only Texture2D %95 = OpLoad %94 
                                      sampler %96 = OpLoad %60 
                   read_only Texture2DSampled %97 = OpSampledImage %95 %96 
                                        f32_2 %98 = OpLoad vs_TEXCOORD0 
                                        f32_4 %99 = OpImageSampleImplicitLod %97 %98 
                                         f32 %100 = OpCompositeExtract %99 0 
                                                      OpStore %93 %100 
                                         f32 %101 = OpLoad %93 
                                Uniform f32* %103 = OpAccessChain %17 %102 %29 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFMul %101 %104 
                                                      OpStore %93 %105 
                                Private f32* %106 = OpAccessChain %53 %29 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpLoad %93 
                                         f32 %109 = OpFMul %107 %108 
                                Uniform f32* %111 = OpAccessChain %17 %102 %110 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFAdd %109 %112 
                                Private f32* %114 = OpAccessChain %53 %29 
                                                      OpStore %114 %113 
                                Uniform f32* %115 = OpAccessChain %17 %87 %39 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                         f32 %118 = OpLoad %93 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %120 = OpFAdd %119 %48 
                                                      OpStore %93 %120 
                                         f32 %121 = OpLoad %93 
                                Private f32* %122 = OpAccessChain %53 %29 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFDiv %121 %123 
                                Private f32* %125 = OpAccessChain %53 %29 
                                                      OpStore %125 %124 
                                Private f32* %130 = OpAccessChain %53 %29 
                                         f32 %131 = OpLoad %130 
                                        bool %132 = OpFOrdLessThan %129 %131 
                                                      OpStore %128 %132 
                                        bool %135 = OpLoad %128 
                                                      OpSelectionMerge %139 None 
                                                      OpBranchConditional %135 %138 %142 
                                             %138 = OpLabel 
                                       f32_2 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %140 0 0 0 0 
                                                      OpStore %137 %141 
                                                      OpBranch %139 
                                             %142 = OpLabel 
                                                      OpStore %137 %143 
                                                      OpBranch %139 
                                             %139 = OpLabel 
                                       f32_4 %144 = OpLoad %137 
                                                      OpStore %134 %144 
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
  Name "Sunshafts blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 89719
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
uniform 	vec4 _SunPosition;
uniform 	float _BlurRadius;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
int u_xlati7;
bool u_xlatb10;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
    {
        u_xlat2 = texture(_MainTex, u_xlat1.xy);
        u_xlat0 = u_xlat0 + u_xlat2;
        u_xlat2.xy = (-u_xlat1.xy) + _SunPosition.xy;
        u_xlat1.xy = u_xlat2.xy * vec2(_BlurRadius) + u_xlat1.xy;
    }
    SV_Target0 = u_xlat0 * vec4(0.0833333358, 0.0833333358, 0.0833333358, 0.0833333358);
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
; Bound: 91
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %81 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpMemberDecorate %58 0 Offset 58 
                                             OpMemberDecorate %58 1 Offset 58 
                                             OpDecorate %58 Block 
                                             OpDecorate %60 DescriptorSet 60 
                                             OpDecorate %60 Binding 60 
                                             OpDecorate %81 Location 81 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                 f32 %10 = OpConstant 3.674022E-40 
                                     %11 = OpTypeInt 32 0 
                                 u32 %12 = OpConstant 0 
                                     %13 = OpTypePointer Private %6 
                                 u32 %15 = OpConstant 1 
                                 u32 %17 = OpConstant 2 
                                 u32 %19 = OpConstant 3 
                                     %21 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Private %21 
                      Private f32_2* %23 = OpVariable Private 
                                     %24 = OpTypePointer Input %21 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %27 = OpTypeInt 32 1 
                                     %28 = OpTypePointer Function %27 
                                 i32 %30 = OpConstant 0 
                                 i32 %37 = OpConstant 12 
                                     %38 = OpTypeBool 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %42 = OpTypePointer UniformConstant %41 
UniformConstant read_only Texture2D* %43 = OpVariable UniformConstant 
                                     %45 = OpTypeSampler 
                                     %46 = OpTypePointer UniformConstant %45 
            UniformConstant sampler* %47 = OpVariable UniformConstant 
                                     %49 = OpTypeSampledImage %41 
                                     %58 = OpTypeStruct %7 %6 
                                     %59 = OpTypePointer Uniform %58 
       Uniform struct {f32_4; f32;}* %60 = OpVariable Uniform 
                                     %61 = OpTypePointer Uniform %7 
                                 i32 %70 = OpConstant 1 
                                     %71 = OpTypePointer Uniform %6 
                                     %80 = OpTypePointer Output %7 
                       Output f32_4* %81 = OpVariable Output 
                                 f32 %83 = OpConstant 3.674022E-40 
                               f32_4 %84 = OpConstantComposite %83 %83 %83 %83 
                                     %87 = OpTypePointer Private %27 
                        Private i32* %88 = OpVariable Private 
                                     %89 = OpTypePointer Private %38 
                       Private bool* %90 = OpVariable Private 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                       Function i32* %29 = OpVariable Function 
                        Private f32* %14 = OpAccessChain %9 %12 
                                             OpStore %14 %10 
                        Private f32* %16 = OpAccessChain %9 %15 
                                             OpStore %16 %10 
                        Private f32* %18 = OpAccessChain %9 %17 
                                             OpStore %18 %10 
                        Private f32* %20 = OpAccessChain %9 %19 
                                             OpStore %20 %10 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                                             OpStore %23 %26 
                                             OpStore %29 %30 
                                             OpBranch %31 
                                     %31 = OpLabel 
                                             OpLoopMerge %33 %34 None 
                                             OpBranch %35 
                                     %35 = OpLabel 
                                 i32 %36 = OpLoad %29 
                                bool %39 = OpSLessThan %36 %37 
                                             OpBranchConditional %39 %32 %33 
                                     %32 = OpLabel 
                 read_only Texture2D %44 = OpLoad %43 
                             sampler %48 = OpLoad %47 
          read_only Texture2DSampled %50 = OpSampledImage %44 %48 
                               f32_2 %51 = OpLoad %23 
                               f32_4 %52 = OpImageSampleImplicitLod %50 %51 
                                             OpStore %40 %52 
                               f32_4 %53 = OpLoad %9 
                               f32_4 %54 = OpLoad %40 
                               f32_4 %55 = OpFAdd %53 %54 
                                             OpStore %9 %55 
                               f32_2 %56 = OpLoad %23 
                               f32_2 %57 = OpFNegate %56 
                      Uniform f32_4* %62 = OpAccessChain %60 %30 
                               f32_4 %63 = OpLoad %62 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_2 %65 = OpFAdd %57 %64 
                               f32_4 %66 = OpLoad %40 
                               f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
                                             OpStore %40 %67 
                               f32_4 %68 = OpLoad %40 
                               f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                        Uniform f32* %72 = OpAccessChain %60 %70 
                                 f32 %73 = OpLoad %72 
                               f32_2 %74 = OpCompositeConstruct %73 %73 
                               f32_2 %75 = OpFMul %69 %74 
                               f32_2 %76 = OpLoad %23 
                               f32_2 %77 = OpFAdd %75 %76 
                                             OpStore %23 %77 
                                             OpBranch %34 
                                     %34 = OpLabel 
                                 i32 %78 = OpLoad %29 
                                 i32 %79 = OpIAdd %78 %70 
                                             OpStore %29 %79 
                                             OpBranch %31 
                                     %33 = OpLabel 
                               f32_4 %82 = OpLoad %9 
                               f32_4 %85 = OpFMul %82 %84 
                                             OpStore %81 %85 
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
  Name "Sunshafts composite"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 194437
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
uniform 	float _BlendMode;
uniform 	vec4 _SunColor;
uniform 	vec4 _SunPosition;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SunshaftBuffer;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
void main()
{
    u_xlat0 = texture(_SunshaftBuffer, vs_TEXCOORD0.xy);
    u_xlat1.xyz = _SunColor.xyz * _SunPosition.zzz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat3.w;
    u_xlatb2.xy = equal(vec4(_BlendMode), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.xyz = u_xlatb2.x ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
    SV_Target0.xyz = (u_xlatb2.y) ? u_xlat1.xyz : u_xlat0.xyz;
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
; Bound: 117
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %52 %69 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %28 0 Offset 28 
                                             OpMemberDecorate %28 1 Offset 28 
                                             OpMemberDecorate %28 2 Offset 28 
                                             OpDecorate %28 Block 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %48 DescriptorSet 48 
                                             OpDecorate %48 Binding 48 
                                             OpDecorate vs_TEXCOORD1 Location 52 
                                             OpDecorate %69 Location 69 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
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
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %28 = OpTypeStruct %6 %24 %24 
                                     %29 = OpTypePointer Uniform %28 
Uniform struct {f32; f32_4; f32_4;}* %30 = OpVariable Uniform 
                                     %31 = OpTypeInt 32 1 
                                 i32 %32 = OpConstant 1 
                                     %33 = OpTypePointer Uniform %24 
                                 i32 %37 = OpConstant 2 
                      Private f32_3* %42 = OpVariable Private 
                                     %46 = OpTypePointer Private %24 
                      Private f32_4* %47 = OpVariable Private 
UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %68 = OpTypePointer Output %24 
                       Output f32_4* %69 = OpVariable Output 
                                     %70 = OpTypeInt 32 0 
                                 u32 %71 = OpConstant 3 
                                     %72 = OpTypePointer Private %6 
                                     %75 = OpTypePointer Output %6 
                                     %77 = OpTypeBool 
                                     %78 = OpTypeVector %77 2 
                                     %79 = OpTypePointer Private %78 
                     Private bool_2* %80 = OpVariable Private 
                                 i32 %81 = OpConstant 0 
                                     %82 = OpTypePointer Uniform %6 
                                 f32 %86 = OpConstant 3.674022E-40 
                                 f32 %87 = OpConstant 3.674022E-40 
                               f32_4 %88 = OpConstantComposite %86 %87 %86 %86 
                                     %89 = OpTypeVector %77 4 
                                 u32 %92 = OpConstant 0 
                                     %93 = OpTypePointer Private %77 
                                     %96 = OpTypePointer Function %7 
                              f32_3 %102 = OpConstantComposite %86 %86 %86 
                                u32 %104 = OpConstant 1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_3* %97 = OpVariable Function 
                    Function f32_3* %107 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                      Uniform f32_4* %34 = OpAccessChain %30 %32 
                               f32_4 %35 = OpLoad %34 
                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                      Uniform f32_4* %38 = OpAccessChain %30 %37 
                               f32_4 %39 = OpLoad %38 
                               f32_3 %40 = OpVectorShuffle %39 %39 2 2 2 
                               f32_3 %41 = OpFMul %36 %40 
                                             OpStore %27 %41 
                               f32_3 %43 = OpLoad %9 
                               f32_3 %44 = OpLoad %27 
                               f32_3 %45 = OpFMul %43 %44 
                                             OpStore %42 %45 
                 read_only Texture2D %49 = OpLoad %48 
                             sampler %50 = OpLoad %16 
          read_only Texture2DSampled %51 = OpSampledImage %49 %50 
                               f32_2 %53 = OpLoad vs_TEXCOORD1 
                               f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                             OpStore %47 %54 
                               f32_3 %55 = OpLoad %9 
                               f32_3 %56 = OpLoad %27 
                               f32_3 %57 = OpFMul %55 %56 
                               f32_4 %58 = OpLoad %47 
                               f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               f32_3 %60 = OpFAdd %57 %59 
                                             OpStore %9 %60 
                               f32_3 %61 = OpLoad %42 
                               f32_3 %62 = OpFNegate %61 
                               f32_4 %63 = OpLoad %47 
                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                               f32_3 %65 = OpFMul %62 %64 
                               f32_3 %66 = OpLoad %9 
                               f32_3 %67 = OpFAdd %65 %66 
                                             OpStore %27 %67 
                        Private f32* %73 = OpAccessChain %47 %71 
                                 f32 %74 = OpLoad %73 
                         Output f32* %76 = OpAccessChain %69 %71 
                                             OpStore %76 %74 
                        Uniform f32* %83 = OpAccessChain %30 %81 
                                 f32 %84 = OpLoad %83 
                               f32_4 %85 = OpCompositeConstruct %84 %84 %84 %84 
                              bool_4 %90 = OpFOrdEqual %85 %88 
                              bool_2 %91 = OpVectorShuffle %90 %90 0 1 
                                             OpStore %80 %91 
                       Private bool* %94 = OpAccessChain %80 %92 
                                bool %95 = OpLoad %94 
                                             OpSelectionMerge %99 None 
                                             OpBranchConditional %95 %98 %101 
                                     %98 = OpLabel 
                              f32_3 %100 = OpLoad %9 
                                             OpStore %97 %100 
                                             OpBranch %99 
                                    %101 = OpLabel 
                                             OpStore %97 %102 
                                             OpBranch %99 
                                     %99 = OpLabel 
                              f32_3 %103 = OpLoad %97 
                                             OpStore %9 %103 
                      Private bool* %105 = OpAccessChain %80 %104 
                               bool %106 = OpLoad %105 
                                             OpSelectionMerge %109 None 
                                             OpBranchConditional %106 %108 %111 
                                    %108 = OpLabel 
                              f32_3 %110 = OpLoad %27 
                                             OpStore %107 %110 
                                             OpBranch %109 
                                    %111 = OpLabel 
                              f32_3 %112 = OpLoad %9 
                                             OpStore %107 %112 
                                             OpBranch %109 
                                    %109 = OpLabel 
                              f32_3 %113 = OpLoad %107 
                              f32_4 %114 = OpLoad %69 
                              f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                             OpStore %69 %115 
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