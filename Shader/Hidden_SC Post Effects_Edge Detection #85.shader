//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Edge Detection" {
Properties {
}
SubShader {
 Pass {
  Name "Edge Detection: Depth Normals"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 11752
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _EdgeSize;
in  vec3 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat4;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = (-_MainTex_TexelSize.xy) * vec2(vec2(_EdgeSize, _EdgeSize)) + u_xlat4.xy;
    vs_TEXCOORD2.xy = u_xlat4.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1.x = _MainTex_TexelSize.x * _EdgeSize;
    u_xlat1.y = (-_MainTex_TexelSize.y) * _EdgeSize;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _Sensitivity;
uniform 	float _BackgroundFade;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeOpacity;
uniform 	vec4 _FadeParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthNormalsTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
bvec2 u_xlatb6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.zw);
    u_xlat1 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat6.x = dot(u_xlat0.zw, vec2(1.0, 0.00392156886));
    u_xlat0.xy = abs(u_xlat0.xy) * _Sensitivity.yy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Sensitivity.y;
    u_xlatb0.x = u_xlat0.x<0.100000001;
    u_xlat3.x = dot(u_xlat1.zw, vec2(1.0, 0.00392156886));
    u_xlat6.x = (-u_xlat6.x) + u_xlat3.x;
    u_xlat6.x = abs(u_xlat6.x) * _Sensitivity.x;
    u_xlat9 = u_xlat3.x * 0.0900000036;
    u_xlatb0.z = u_xlat6.x<u_xlat9;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat2 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD1.xy);
    u_xlat1.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat6.x = dot(u_xlat2.zw, vec2(1.0, 0.00392156886));
    u_xlat6.x = (-u_xlat6.x) + u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat6.x = abs(u_xlat6.x) * _Sensitivity.x;
    u_xlatb6.x = u_xlat6.x<u_xlat9;
    u_xlat1.xy = abs(u_xlat1.xy) * _Sensitivity.yy;
    u_xlat9 = u_xlat1.y + u_xlat1.x;
    u_xlat9 = u_xlat9 * _Sensitivity.y;
    u_xlatb6.y = u_xlat9<0.100000001;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlat6.x = u_xlat6.x * u_xlat6.y;
    u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
    u_xlat6.x = (-u_xlat3.x) + 1.0;
    u_xlat6.x = _ZBufferParams.z * u_xlat6.x + _ZBufferParams.w;
    u_xlat6.x = (-u_xlat6.x) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat6.x = (-u_xlat3.x) + u_xlat6.x;
    u_xlat3.x = unity_OrthoParams.w * u_xlat6.x + u_xlat3.x;
    u_xlat3.x = (-u_xlat3.x) + _FadeParams.y;
    u_xlat6.x = (-_FadeParams.x) + _FadeParams.y;
    u_xlat3.x = u_xlat3.x / u_xlat6.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat6.x = (-u_xlat3.x) + 1.0;
    u_xlatb9 = _FadeParams.z==1.0;
    u_xlat3.x = (u_xlatb9) ? u_xlat6.x : u_xlat3.x;
    u_xlatb6.x = _FadeParams.w!=0.0;
    u_xlat3.x = (u_xlatb6.x) ? u_xlat3.x : 1.0;
    u_xlat3.x = u_xlat3.x * _EdgeOpacity;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(_BackgroundFade) * u_xlat2 + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) + _EdgeColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
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
; Bound: 114
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %32 %92 %99 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD0 Location 32 
                                             OpMemberDecorate %52 0 Offset 52 
                                             OpMemberDecorate %52 1 Offset 52 
                                             OpMemberDecorate %52 2 Offset 52 
                                             OpDecorate %52 Block 
                                             OpDecorate %54 DescriptorSet 54 
                                             OpDecorate %54 Binding 54 
                                             OpDecorate vs_TEXCOORD1 Location 92 
                                             OpDecorate vs_TEXCOORD2 Location 99 
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
              Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                 f32 %35 = OpConstant 3.674022E-40 
                                 f32 %36 = OpConstant 3.674022E-40 
                               f32_2 %37 = OpConstantComposite %35 %36 
                               f32_2 %39 = OpConstantComposite %35 %35 
                                     %43 = OpTypePointer Private %19 
                      Private f32_2* %44 = OpVariable Private 
                               f32_2 %47 = OpConstantComposite %27 %27 
                                     %52 = OpTypeStruct %6 %7 %6 
                                     %53 = OpTypePointer Uniform %52 
  Uniform struct {f32; f32_4; f32;}* %54 = OpVariable Uniform 
                                 i32 %55 = OpConstant 1 
                                     %56 = OpTypePointer Uniform %7 
                                 i32 %61 = OpConstant 2 
                                     %62 = OpTypePointer Uniform %6 
                      Private f32_2* %76 = OpVariable Private 
                                 u32 %77 = OpConstant 0 
                                     %83 = OpTypePointer Private %6 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                     %98 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                              f32_2 %105 = OpConstantComposite %26 %26 
                                    %108 = OpTypePointer Output %6 
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
                               f32_3 %33 = OpLoad %18 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_2 %38 = OpFMul %34 %37 
                               f32_2 %40 = OpFAdd %38 %39 
                               f32_4 %41 = OpLoad vs_TEXCOORD0 
                               f32_4 %42 = OpVectorShuffle %41 %40 4 5 2 3 
                                             OpStore vs_TEXCOORD0 %42 
                               f32_3 %45 = OpLoad %18 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %48 = OpFAdd %46 %47 
                                             OpStore %44 %48 
                               f32_2 %49 = OpLoad %44 
                               f32_2 %50 = OpFMul %49 %37 
                               f32_2 %51 = OpFAdd %50 %28 
                                             OpStore %44 %51 
                      Uniform f32_4* %57 = OpAccessChain %54 %55 
                               f32_4 %58 = OpLoad %57 
                               f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                               f32_2 %60 = OpFNegate %59 
                        Uniform f32* %63 = OpAccessChain %54 %61 
                                 f32 %64 = OpLoad %63 
                        Uniform f32* %65 = OpAccessChain %54 %61 
                                 f32 %66 = OpLoad %65 
                               f32_2 %67 = OpCompositeConstruct %64 %66 
                                 f32 %68 = OpCompositeExtract %67 0 
                                 f32 %69 = OpCompositeExtract %67 1 
                               f32_2 %70 = OpCompositeConstruct %68 %69 
                               f32_2 %71 = OpFMul %60 %70 
                               f32_2 %72 = OpLoad %44 
                               f32_2 %73 = OpFAdd %71 %72 
                               f32_4 %74 = OpLoad vs_TEXCOORD0 
                               f32_4 %75 = OpVectorShuffle %74 %73 0 1 4 5 
                                             OpStore vs_TEXCOORD0 %75 
                        Uniform f32* %78 = OpAccessChain %54 %55 %77 
                                 f32 %79 = OpLoad %78 
                        Uniform f32* %80 = OpAccessChain %54 %61 
                                 f32 %81 = OpLoad %80 
                                 f32 %82 = OpFMul %79 %81 
                        Private f32* %84 = OpAccessChain %76 %77 
                                             OpStore %84 %82 
                        Uniform f32* %85 = OpAccessChain %54 %55 %9 
                                 f32 %86 = OpLoad %85 
                                 f32 %87 = OpFNegate %86 
                        Uniform f32* %88 = OpAccessChain %54 %61 
                                 f32 %89 = OpLoad %88 
                                 f32 %90 = OpFMul %87 %89 
                        Private f32* %91 = OpAccessChain %76 %9 
                                             OpStore %91 %90 
                               f32_2 %93 = OpLoad %44 
                               f32_2 %94 = OpLoad %76 
                               f32_2 %95 = OpFAdd %93 %94 
                               f32_4 %96 = OpLoad vs_TEXCOORD1 
                               f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                             OpStore vs_TEXCOORD1 %97 
                              f32_2 %100 = OpLoad %44 
                       Uniform f32* %101 = OpAccessChain %54 %15 
                                f32 %102 = OpLoad %101 
                              f32_2 %103 = OpCompositeConstruct %102 %102 
                              f32_2 %104 = OpFMul %100 %103 
                                             OpStore vs_TEXCOORD2 %104 
                              f32_4 %106 = OpLoad vs_TEXCOORD1 
                              f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                             OpStore vs_TEXCOORD1 %107 
                        Output f32* %109 = OpAccessChain %13 %15 %9 
                                f32 %110 = OpLoad %109 
                                f32 %111 = OpFNegate %110 
                        Output f32* %112 = OpAccessChain %13 %15 %9 
                                             OpStore %112 %111 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 407
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %21 %143 %392 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 21 
                                                      OpMemberDecorate %56 0 Offset 56 
                                                      OpMemberDecorate %56 1 Offset 56 
                                                      OpMemberDecorate %56 2 Offset 56 
                                                      OpMemberDecorate %56 3 Offset 56 
                                                      OpMemberDecorate %56 4 Offset 56 
                                                      OpMemberDecorate %56 5 Offset 56 
                                                      OpMemberDecorate %56 6 Offset 56 
                                                      OpMemberDecorate %56 7 Offset 56 
                                                      OpDecorate %56 Block 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate vs_TEXCOORD1 Location 143 
                                                      OpDecorate %345 DescriptorSet 345 
                                                      OpDecorate %345 Binding 345 
                                                      OpDecorate %392 Location 392 
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
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                              %22 = OpTypeVector %6 2 
                               Private f32_4* %26 = OpVariable Private 
                                              %41 = OpTypePointer Private %22 
                               Private f32_2* %42 = OpVariable Private 
                                          f32 %45 = OpConstant 3.674022E-40 
                                          f32 %46 = OpConstant 3.674022E-40 
                                        f32_2 %47 = OpConstantComposite %45 %46 
                                              %49 = OpTypeInt 32 0 
                                          u32 %50 = OpConstant 0 
                                              %51 = OpTypePointer Private %6 
                                              %56 = OpTypeStruct %7 %7 %7 %7 %6 %7 %6 %7 
                                              %57 = OpTypePointer Uniform %56 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32; f32_4; f32; f32_4;}* %58 = OpVariable Uniform 
                                              %59 = OpTypeInt 32 1 
                                          i32 %60 = OpConstant 3 
                                              %61 = OpTypePointer Uniform %7 
                                          u32 %68 = OpConstant 1 
                                              %77 = OpTypePointer Uniform %6 
                                              %82 = OpTypeBool 
                                              %83 = OpTypeVector %82 3 
                                              %84 = OpTypePointer Private %83 
                              Private bool_3* %85 = OpVariable Private 
                                          f32 %88 = OpConstant 3.674022E-40 
                                              %90 = OpTypePointer Private %82 
                                              %92 = OpTypeVector %6 3 
                                              %93 = OpTypePointer Private %92 
                               Private f32_3* %94 = OpVariable Private 
                                Private f32* %113 = OpVariable Private 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         u32 %122 = OpConstant 2 
                                         f32 %126 = OpConstant 3.674022E-40 
                              Private f32_4* %139 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         i32 %168 = OpConstant 0 
                                             %184 = OpTypeVector %82 2 
                                             %185 = OpTypePointer Private %184 
                             Private bool_2* %186 = OpVariable Private 
                                         i32 %240 = OpConstant 2 
                                         u32 %246 = OpConstant 3 
                                         i32 %268 = OpConstant 1 
                                         i32 %281 = OpConstant 7 
                               Private bool* %308 = OpVariable Private 
                                             %313 = OpTypePointer Function %6 
                                         i32 %340 = OpConstant 6 
        UniformConstant read_only Texture2D* %345 = OpVariable UniformConstant 
                                       f32_4 %354 = OpConstantComposite %45 %45 %45 %45 
                                         i32 %356 = OpConstant 4 
                                         i32 %367 = OpConstant 5 
                                             %391 = OpTypePointer Output %7 
                               Output f32_4* %392 = OpVariable Output 
                                             %404 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %314 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_4 %23 = OpLoad vs_TEXCOORD0 
                                        f32_2 %24 = OpVectorShuffle %23 %23 2 3 
                                        f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                                      OpStore %9 %25 
                          read_only Texture2D %27 = OpLoad %12 
                                      sampler %28 = OpLoad %16 
                   read_only Texture2DSampled %29 = OpSampledImage %27 %28 
                                        f32_4 %30 = OpLoad vs_TEXCOORD0 
                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                        f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                                      OpStore %26 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFNegate %34 
                                        f32_4 %36 = OpLoad %26 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                        f32_2 %38 = OpFAdd %35 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %9 %40 
                                        f32_4 %43 = OpLoad %9 
                                        f32_2 %44 = OpVectorShuffle %43 %43 2 3 
                                          f32 %48 = OpDot %44 %47 
                                 Private f32* %52 = OpAccessChain %42 %50 
                                                      OpStore %52 %48 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_2 %55 = OpExtInst %1 4 %54 
                               Uniform f32_4* %62 = OpAccessChain %58 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_2 %64 = OpVectorShuffle %63 %63 1 1 
                                        f32_2 %65 = OpFMul %55 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
                                                      OpStore %9 %67 
                                 Private f32* %69 = OpAccessChain %9 %68 
                                          f32 %70 = OpLoad %69 
                                 Private f32* %71 = OpAccessChain %9 %50 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFAdd %70 %72 
                                 Private f32* %74 = OpAccessChain %9 %50 
                                                      OpStore %74 %73 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %58 %60 %68 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFMul %76 %79 
                                 Private f32* %81 = OpAccessChain %9 %50 
                                                      OpStore %81 %80 
                                 Private f32* %86 = OpAccessChain %9 %50 
                                          f32 %87 = OpLoad %86 
                                         bool %89 = OpFOrdLessThan %87 %88 
                                Private bool* %91 = OpAccessChain %85 %50 
                                                      OpStore %91 %89 
                                        f32_4 %95 = OpLoad %26 
                                        f32_2 %96 = OpVectorShuffle %95 %95 2 3 
                                          f32 %97 = OpDot %96 %47 
                                 Private f32* %98 = OpAccessChain %94 %50 
                                                      OpStore %98 %97 
                                 Private f32* %99 = OpAccessChain %42 %50 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                Private f32* %102 = OpAccessChain %94 %50 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %42 %50 
                                                      OpStore %105 %104 
                                Private f32* %106 = OpAccessChain %42 %50 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpExtInst %1 4 %107 
                                Uniform f32* %109 = OpAccessChain %58 %60 %50 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                Private f32* %112 = OpAccessChain %42 %50 
                                                      OpStore %112 %111 
                                Private f32* %114 = OpAccessChain %94 %50 
                                         f32 %115 = OpLoad %114 
                                         f32 %117 = OpFMul %115 %116 
                                                      OpStore %113 %117 
                                Private f32* %118 = OpAccessChain %42 %50 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %113 
                                        bool %121 = OpFOrdLessThan %119 %120 
                               Private bool* %123 = OpAccessChain %85 %122 
                                                      OpStore %123 %121 
                               Private bool* %124 = OpAccessChain %85 %50 
                                        bool %125 = OpLoad %124 
                                         f32 %127 = OpSelect %125 %45 %126 
                                Private f32* %128 = OpAccessChain %9 %50 
                                                      OpStore %128 %127 
                               Private bool* %129 = OpAccessChain %85 %122 
                                        bool %130 = OpLoad %129 
                                         f32 %131 = OpSelect %130 %45 %126 
                                Private f32* %132 = OpAccessChain %9 %122 
                                                      OpStore %132 %131 
                                Private f32* %133 = OpAccessChain %9 %122 
                                         f32 %134 = OpLoad %133 
                                Private f32* %135 = OpAccessChain %9 %50 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %134 %136 
                                Private f32* %138 = OpAccessChain %9 %50 
                                                      OpStore %138 %137 
                         read_only Texture2D %140 = OpLoad %12 
                                     sampler %141 = OpLoad %16 
                  read_only Texture2DSampled %142 = OpSampledImage %140 %141 
                                       f32_4 %144 = OpLoad vs_TEXCOORD1 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_4 %146 = OpImageSampleImplicitLod %142 %145 
                                                      OpStore %139 %146 
                                       f32_4 %147 = OpLoad %26 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_4 %149 = OpLoad %139 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %151 = OpFNegate %150 
                                       f32_2 %152 = OpFAdd %148 %151 
                                       f32_4 %153 = OpLoad %26 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %26 %154 
                                       f32_4 %155 = OpLoad %139 
                                       f32_2 %156 = OpVectorShuffle %155 %155 2 3 
                                         f32 %157 = OpDot %156 %47 
                                Private f32* %158 = OpAccessChain %42 %50 
                                                      OpStore %158 %157 
                                Private f32* %159 = OpAccessChain %42 %50 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFNegate %160 
                                Private f32* %162 = OpAccessChain %94 %50 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFAdd %161 %163 
                                Private f32* %165 = OpAccessChain %42 %50 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %94 %50 
                                         f32 %167 = OpLoad %166 
                                Uniform f32* %169 = OpAccessChain %58 %168 %122 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFMul %167 %170 
                                Uniform f32* %172 = OpAccessChain %58 %168 %68 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpFAdd %171 %174 
                                Private f32* %176 = OpAccessChain %94 %50 
                                                      OpStore %176 %175 
                                Private f32* %177 = OpAccessChain %42 %50 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpExtInst %1 4 %178 
                                Uniform f32* %180 = OpAccessChain %58 %60 %50 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFMul %179 %181 
                                Private f32* %183 = OpAccessChain %42 %50 
                                                      OpStore %183 %182 
                                Private f32* %187 = OpAccessChain %42 %50 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpLoad %113 
                                        bool %190 = OpFOrdLessThan %188 %189 
                               Private bool* %191 = OpAccessChain %186 %50 
                                                      OpStore %191 %190 
                                       f32_4 %192 = OpLoad %26 
                                       f32_2 %193 = OpVectorShuffle %192 %192 0 1 
                                       f32_2 %194 = OpExtInst %1 4 %193 
                              Uniform f32_4* %195 = OpAccessChain %58 %60 
                                       f32_4 %196 = OpLoad %195 
                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
                                       f32_2 %198 = OpFMul %194 %197 
                                       f32_4 %199 = OpLoad %26 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
                                                      OpStore %26 %200 
                                Private f32* %201 = OpAccessChain %26 %68 
                                         f32 %202 = OpLoad %201 
                                Private f32* %203 = OpAccessChain %26 %50 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFAdd %202 %204 
                                                      OpStore %113 %205 
                                         f32 %206 = OpLoad %113 
                                Uniform f32* %207 = OpAccessChain %58 %60 %68 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFMul %206 %208 
                                                      OpStore %113 %209 
                                         f32 %210 = OpLoad %113 
                                        bool %211 = OpFOrdLessThan %210 %88 
                               Private bool* %212 = OpAccessChain %186 %68 
                                                      OpStore %212 %211 
                               Private bool* %213 = OpAccessChain %186 %50 
                                        bool %214 = OpLoad %213 
                                         f32 %215 = OpSelect %214 %45 %126 
                                Private f32* %216 = OpAccessChain %42 %50 
                                                      OpStore %216 %215 
                               Private bool* %217 = OpAccessChain %186 %68 
                                        bool %218 = OpLoad %217 
                                         f32 %219 = OpSelect %218 %45 %126 
                                Private f32* %220 = OpAccessChain %42 %68 
                                                      OpStore %220 %219 
                                Private f32* %221 = OpAccessChain %42 %50 
                                         f32 %222 = OpLoad %221 
                                Private f32* %223 = OpAccessChain %42 %68 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %222 %224 
                                Private f32* %226 = OpAccessChain %42 %50 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %9 %50 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                Private f32* %230 = OpAccessChain %42 %50 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFMul %229 %231 
                                         f32 %233 = OpFAdd %232 %45 
                                Private f32* %234 = OpAccessChain %9 %50 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %94 %50 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFNegate %236 
                                         f32 %238 = OpFAdd %237 %45 
                                Private f32* %239 = OpAccessChain %42 %50 
                                                      OpStore %239 %238 
                                Uniform f32* %241 = OpAccessChain %58 %240 %122 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %42 %50 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                Uniform f32* %247 = OpAccessChain %58 %240 %246 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFAdd %245 %248 
                                Private f32* %250 = OpAccessChain %42 %50 
                                                      OpStore %250 %249 
                                Private f32* %251 = OpAccessChain %42 %50 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                Uniform f32* %254 = OpAccessChain %58 %168 %246 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFMul %253 %255 
                                Uniform f32* %257 = OpAccessChain %58 %168 %122 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFAdd %256 %258 
                                Private f32* %260 = OpAccessChain %42 %50 
                                                      OpStore %260 %259 
                                Private f32* %261 = OpAccessChain %94 %50 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                Private f32* %264 = OpAccessChain %42 %50 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFAdd %263 %265 
                                Private f32* %267 = OpAccessChain %42 %50 
                                                      OpStore %267 %266 
                                Uniform f32* %269 = OpAccessChain %58 %268 %246 
                                         f32 %270 = OpLoad %269 
                                Private f32* %271 = OpAccessChain %42 %50 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %270 %272 
                                Private f32* %274 = OpAccessChain %94 %50 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFAdd %273 %275 
                                Private f32* %277 = OpAccessChain %94 %50 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %94 %50 
                                         f32 %279 = OpLoad %278 
                                         f32 %280 = OpFNegate %279 
                                Uniform f32* %282 = OpAccessChain %58 %281 %68 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %280 %283 
                                Private f32* %285 = OpAccessChain %94 %50 
                                                      OpStore %285 %284 
                                Uniform f32* %286 = OpAccessChain %58 %281 %50 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFNegate %287 
                                Uniform f32* %289 = OpAccessChain %58 %281 %68 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFAdd %288 %290 
                                Private f32* %292 = OpAccessChain %42 %50 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %94 %50 
                                         f32 %294 = OpLoad %293 
                                Private f32* %295 = OpAccessChain %42 %50 
                                         f32 %296 = OpLoad %295 
                                         f32 %297 = OpFDiv %294 %296 
                                Private f32* %298 = OpAccessChain %94 %50 
                                                      OpStore %298 %297 
                                Private f32* %299 = OpAccessChain %94 %50 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpExtInst %1 43 %300 %126 %45 
                                Private f32* %302 = OpAccessChain %94 %50 
                                                      OpStore %302 %301 
                                Private f32* %303 = OpAccessChain %94 %50 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFNegate %304 
                                         f32 %306 = OpFAdd %305 %45 
                                Private f32* %307 = OpAccessChain %42 %50 
                                                      OpStore %307 %306 
                                Uniform f32* %309 = OpAccessChain %58 %281 %122 
                                         f32 %310 = OpLoad %309 
                                        bool %311 = OpFOrdEqual %310 %45 
                                                      OpStore %308 %311 
                                        bool %312 = OpLoad %308 
                                                      OpSelectionMerge %316 None 
                                                      OpBranchConditional %312 %315 %319 
                                             %315 = OpLabel 
                                Private f32* %317 = OpAccessChain %42 %50 
                                         f32 %318 = OpLoad %317 
                                                      OpStore %314 %318 
                                                      OpBranch %316 
                                             %319 = OpLabel 
                                Private f32* %320 = OpAccessChain %94 %50 
                                         f32 %321 = OpLoad %320 
                                                      OpStore %314 %321 
                                                      OpBranch %316 
                                             %316 = OpLabel 
                                         f32 %322 = OpLoad %314 
                                Private f32* %323 = OpAccessChain %94 %50 
                                                      OpStore %323 %322 
                                Uniform f32* %324 = OpAccessChain %58 %281 %246 
                                         f32 %325 = OpLoad %324 
                                        bool %326 = OpFOrdNotEqual %325 %126 
                               Private bool* %327 = OpAccessChain %186 %50 
                                                      OpStore %327 %326 
                               Private bool* %328 = OpAccessChain %186 %50 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %94 %50 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                                      OpStore %330 %45 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %336 = OpLoad %330 
                                Private f32* %337 = OpAccessChain %94 %50 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %94 %50 
                                         f32 %339 = OpLoad %338 
                                Uniform f32* %341 = OpAccessChain %58 %340 
                                         f32 %342 = OpLoad %341 
                                         f32 %343 = OpFMul %339 %342 
                                Private f32* %344 = OpAccessChain %94 %50 
                                                      OpStore %344 %343 
                         read_only Texture2D %346 = OpLoad %345 
                                     sampler %347 = OpLoad %16 
                  read_only Texture2DSampled %348 = OpSampledImage %346 %347 
                                       f32_4 %349 = OpLoad vs_TEXCOORD0 
                                       f32_2 %350 = OpVectorShuffle %349 %349 0 1 
                                       f32_4 %351 = OpImageSampleImplicitLod %348 %350 
                                                      OpStore %26 %351 
                                       f32_4 %352 = OpLoad %26 
                                       f32_4 %353 = OpFNegate %352 
                                       f32_4 %355 = OpFAdd %353 %354 
                                                      OpStore %139 %355 
                                Uniform f32* %357 = OpAccessChain %58 %356 
                                         f32 %358 = OpLoad %357 
                                       f32_4 %359 = OpCompositeConstruct %358 %358 %358 %358 
                                       f32_4 %360 = OpLoad %139 
                                       f32_4 %361 = OpFMul %359 %360 
                                       f32_4 %362 = OpLoad %26 
                                       f32_4 %363 = OpFAdd %361 %362 
                                                      OpStore %26 %363 
                                       f32_4 %364 = OpLoad %26 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_3 %366 = OpFNegate %365 
                              Uniform f32_4* %368 = OpAccessChain %58 %367 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %366 %370 
                                       f32_4 %372 = OpLoad %139 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %139 %373 
                                       f32_3 %374 = OpLoad %94 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 0 0 
                                       f32_4 %376 = OpLoad %139 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %26 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFAdd %378 %380 
                                                      OpStore %94 %381 
                                       f32_3 %382 = OpLoad %94 
                                       f32_3 %383 = OpCompositeConstruct %126 %126 %126 
                                       f32_3 %384 = OpCompositeConstruct %45 %45 %45 
                                       f32_3 %385 = OpExtInst %1 43 %382 %383 %384 
                                                      OpStore %94 %385 
                                       f32_4 %386 = OpLoad %26 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_3 %388 = OpFNegate %387 
                                       f32_3 %389 = OpLoad %94 
                                       f32_3 %390 = OpFAdd %388 %389 
                                                      OpStore %94 %390 
                                       f32_4 %393 = OpLoad %9 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 0 0 
                                       f32_3 %395 = OpLoad %94 
                                       f32_3 %396 = OpFMul %394 %395 
                                       f32_4 %397 = OpLoad %26 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %399 = OpFAdd %396 %398 
                                       f32_4 %400 = OpLoad %392 
                                       f32_4 %401 = OpVectorShuffle %400 %399 4 5 6 3 
                                                      OpStore %392 %401 
                                Private f32* %402 = OpAccessChain %26 %246 
                                         f32 %403 = OpLoad %402 
                                 Output f32* %405 = OpAccessChain %392 %246 
                                                      OpStore %405 %403 
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
  Name "Edge Detection: Cross Depth Normals"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 100069
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _EdgeSize;
in  vec3 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat6;
vec2 u_xlat8;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0 = in_POSITION0.xyxy + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD0 = u_xlat1;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_EdgeSize, _EdgeSize));
    vs_TEXCOORD1.xy = u_xlat0.zw * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw * vec2(0.5, 0.5) + (-u_xlat0.xy);
    u_xlat6.y = _EdgeSize;
    u_xlat6.x = 1.0;
    u_xlat0.xy = u_xlat6.yx * _MainTex_TexelSize.xy;
    u_xlat6.xy = u_xlat6.xy * _MainTex_TexelSize.xy;
    u_xlat8.y = -1.0;
    u_xlat8.x = _EdgeSize;
    vs_TEXCOORD2.xy = u_xlat0.xy * u_xlat8.yx + u_xlat1.zw;
    vs_TEXCOORD2.zw = u_xlat6.xy * u_xlat8.xy + u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw * vec2(_RenderViewportScaleFactor);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _Sensitivity;
uniform 	float _BackgroundFade;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeOpacity;
uniform 	vec4 _FadeParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthNormalsTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bvec2 u_xlatb3;
float u_xlat6;
bool u_xlatb6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD2.zw);
    u_xlat6 = dot(u_xlat0.zw, vec2(1.0, 0.00392156886));
    u_xlat1 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD2.xy);
    u_xlat9 = dot(u_xlat1.zw, vec2(1.0, 0.00392156886));
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = abs(u_xlat0.xy) * _Sensitivity.yy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Sensitivity.y;
    u_xlatb0.x = u_xlat0.x<0.100000001;
    u_xlat3.x = (-u_xlat6) + u_xlat9;
    u_xlat6 = u_xlat9 * 0.0900000036;
    u_xlat3.x = abs(u_xlat3.x) * _Sensitivity.x;
    u_xlatb0.y = u_xlat3.x<u_xlat6;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD1.zw);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat9 = dot(u_xlat1.zw, vec2(1.0, 0.00392156886));
    u_xlat1.x = dot(u_xlat2.zw, vec2(1.0, 0.00392156886));
    u_xlat1.x = u_xlat9 + (-u_xlat1.x);
    u_xlat1.x = abs(u_xlat1.x) * _Sensitivity.x;
    u_xlat3.xy = abs(u_xlat3.xy) * _Sensitivity.yy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _Sensitivity.y;
    u_xlatb3.x = u_xlat3.x<0.100000001;
    u_xlat6 = u_xlat9 * 0.0900000036;
    u_xlat9 = u_xlat9 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlatb3.y = u_xlat1.x<u_xlat6;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat3.x = (-u_xlat9) + 1.0;
    u_xlat3.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
    u_xlat3.x = (-u_xlat3.x) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat3.x = (-u_xlat9) + u_xlat3.x;
    u_xlat3.x = unity_OrthoParams.w * u_xlat3.x + u_xlat9;
    u_xlat3.x = (-u_xlat3.x) + _FadeParams.y;
    u_xlat6 = (-_FadeParams.x) + _FadeParams.y;
    u_xlat3.x = u_xlat3.x / u_xlat6;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat6 = (-u_xlat3.x) + 1.0;
    u_xlatb9 = _FadeParams.z==1.0;
    u_xlat3.x = (u_xlatb9) ? u_xlat6 : u_xlat3.x;
    u_xlatb6 = _FadeParams.w!=0.0;
    u_xlat3.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat3.x = u_xlat3.x * _EdgeOpacity;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(_BackgroundFade) * u_xlat2 + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) + _EdgeColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
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
; Bound: 150
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %47 %117 %137 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD0 Location 45 
                                             OpDecorate vs_TEXCOORD1 Location 47 
                                             OpMemberDecorate %48 0 Offset 48 
                                             OpMemberDecorate %48 1 Offset 48 
                                             OpMemberDecorate %48 2 Offset 48 
                                             OpDecorate %48 Block 
                                             OpDecorate %50 DescriptorSet 50 
                                             OpDecorate %50 Binding 50 
                                             OpDecorate vs_TEXCOORD2 Location 117 
                                             OpDecorate vs_TEXCOORD3 Location 137 
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
                                     %32 = OpTypePointer Private %7 
                      Private f32_4* %33 = OpVariable Private 
                               f32_4 %36 = OpConstantComposite %27 %27 %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_4 %41 = OpConstantComposite %39 %40 %39 %40 
                               f32_4 %43 = OpConstantComposite %26 %27 %26 %27 
              Output f32_4* vs_TEXCOORD0 = OpVariable Output 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                     %48 = OpTypeStruct %6 %7 %6 
                                     %49 = OpTypePointer Uniform %48 
  Uniform struct {f32; f32_4; f32;}* %50 = OpVariable Uniform 
                                 i32 %51 = OpConstant 1 
                                     %52 = OpTypePointer Uniform %7 
                                 i32 %56 = OpConstant 2 
                                     %57 = OpTypePointer Uniform %6 
                                     %90 = OpTypePointer Private %19 
                      Private f32_2* %91 = OpVariable Private 
                                     %94 = OpTypePointer Private %6 
                                 u32 %96 = OpConstant 0 
                     Private f32_2* %106 = OpVariable Private 
                                f32 %112 = OpConstant 3.674022E-40 
              Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                    %136 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD3 = OpVariable Output 
                                    %144 = OpTypePointer Output %6 
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
                               f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
                               f32_4 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_4 %38 = OpLoad %33 
                               f32_4 %42 = OpFMul %38 %41 
                               f32_4 %44 = OpFAdd %42 %43 
                                             OpStore %33 %44 
                               f32_4 %46 = OpLoad %33 
                                             OpStore vs_TEXCOORD0 %46 
                      Uniform f32_4* %53 = OpAccessChain %50 %51 
                               f32_4 %54 = OpLoad %53 
                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                        Uniform f32* %58 = OpAccessChain %50 %56 
                                 f32 %59 = OpLoad %58 
                        Uniform f32* %60 = OpAccessChain %50 %56 
                                 f32 %61 = OpLoad %60 
                               f32_2 %62 = OpCompositeConstruct %59 %61 
                                 f32 %63 = OpCompositeExtract %62 0 
                                 f32 %64 = OpCompositeExtract %62 1 
                               f32_2 %65 = OpCompositeConstruct %63 %64 
                               f32_2 %66 = OpFMul %55 %65 
                               f32_4 %67 = OpLoad %33 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_2 %69 = OpFAdd %66 %68 
                               f32_4 %70 = OpLoad vs_TEXCOORD1 
                               f32_4 %71 = OpVectorShuffle %70 %69 4 5 2 3 
                                             OpStore vs_TEXCOORD1 %71 
                      Uniform f32_4* %72 = OpAccessChain %50 %51 
                               f32_4 %73 = OpLoad %72 
                               f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               f32_2 %75 = OpFNegate %74 
                        Uniform f32* %76 = OpAccessChain %50 %56 
                                 f32 %77 = OpLoad %76 
                        Uniform f32* %78 = OpAccessChain %50 %56 
                                 f32 %79 = OpLoad %78 
                               f32_2 %80 = OpCompositeConstruct %77 %79 
                                 f32 %81 = OpCompositeExtract %80 0 
                                 f32 %82 = OpCompositeExtract %80 1 
                               f32_2 %83 = OpCompositeConstruct %81 %82 
                               f32_2 %84 = OpFMul %75 %83 
                               f32_4 %85 = OpLoad %33 
                               f32_2 %86 = OpVectorShuffle %85 %85 2 3 
                               f32_2 %87 = OpFAdd %84 %86 
                               f32_4 %88 = OpLoad vs_TEXCOORD1 
                               f32_4 %89 = OpVectorShuffle %88 %87 0 1 4 5 
                                             OpStore vs_TEXCOORD1 %89 
                        Uniform f32* %92 = OpAccessChain %50 %56 
                                 f32 %93 = OpLoad %92 
                        Private f32* %95 = OpAccessChain %91 %9 
                                             OpStore %95 %93 
                        Private f32* %97 = OpAccessChain %91 %96 
                                             OpStore %97 %27 
                               f32_2 %98 = OpLoad %91 
                               f32_2 %99 = OpVectorShuffle %98 %98 1 0 
                     Uniform f32_4* %100 = OpAccessChain %50 %51 
                              f32_4 %101 = OpLoad %100 
                              f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                              f32_2 %103 = OpFMul %99 %102 
                              f32_4 %104 = OpLoad %33 
                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 2 3 
                                             OpStore %33 %105 
                              f32_2 %107 = OpLoad %91 
                     Uniform f32_4* %108 = OpAccessChain %50 %51 
                              f32_4 %109 = OpLoad %108 
                              f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              f32_2 %111 = OpFMul %107 %110 
                                             OpStore %106 %111 
                       Private f32* %113 = OpAccessChain %91 %9 
                                             OpStore %113 %112 
                       Uniform f32* %114 = OpAccessChain %50 %56 
                                f32 %115 = OpLoad %114 
                       Private f32* %116 = OpAccessChain %91 %96 
                                             OpStore %116 %115 
                              f32_4 %118 = OpLoad %33 
                              f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                              f32_2 %120 = OpLoad %91 
                              f32_2 %121 = OpVectorShuffle %120 %120 1 0 
                              f32_2 %122 = OpFMul %119 %121 
                              f32_4 %123 = OpLoad %33 
                              f32_2 %124 = OpVectorShuffle %123 %123 2 3 
                              f32_2 %125 = OpFAdd %122 %124 
                              f32_4 %126 = OpLoad vs_TEXCOORD2 
                              f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
                                             OpStore vs_TEXCOORD2 %127 
                              f32_2 %128 = OpLoad %106 
                              f32_2 %129 = OpLoad %91 
                              f32_2 %130 = OpFMul %128 %129 
                              f32_4 %131 = OpLoad %33 
                              f32_2 %132 = OpVectorShuffle %131 %131 2 3 
                              f32_2 %133 = OpFAdd %130 %132 
                              f32_4 %134 = OpLoad vs_TEXCOORD2 
                              f32_4 %135 = OpVectorShuffle %134 %133 0 1 4 5 
                                             OpStore vs_TEXCOORD2 %135 
                              f32_4 %138 = OpLoad %33 
                              f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                       Uniform f32* %140 = OpAccessChain %50 %15 
                                f32 %141 = OpLoad %140 
                              f32_2 %142 = OpCompositeConstruct %141 %141 
                              f32_2 %143 = OpFMul %139 %142 
                                             OpStore vs_TEXCOORD3 %143 
                        Output f32* %145 = OpAccessChain %13 %15 %9 
                                f32 %146 = OpLoad %145 
                                f32 %147 = OpFNegate %146 
                        Output f32* %148 = OpAccessChain %13 %15 %9 
                                             OpStore %148 %147 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 392
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %21 %135 %345 %377 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD2 Location 21 
                                                      OpMemberDecorate %56 0 Offset 56 
                                                      OpMemberDecorate %56 1 Offset 56 
                                                      OpMemberDecorate %56 2 Offset 56 
                                                      OpMemberDecorate %56 3 Offset 56 
                                                      OpMemberDecorate %56 4 Offset 56 
                                                      OpMemberDecorate %56 5 Offset 56 
                                                      OpMemberDecorate %56 6 Offset 56 
                                                      OpMemberDecorate %56 7 Offset 56 
                                                      OpDecorate %56 Block 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate vs_TEXCOORD1 Location 135 
                                                      OpDecorate %341 DescriptorSet 341 
                                                      OpDecorate %341 Binding 341 
                                                      OpDecorate vs_TEXCOORD0 Location 345 
                                                      OpDecorate %377 Location 377 
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
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %22 = OpTypeVector %6 2 
                                              %26 = OpTypePointer Private %6 
                                 Private f32* %27 = OpVariable Private 
                                          f32 %30 = OpConstant 3.674022E-40 
                                          f32 %31 = OpConstant 3.674022E-40 
                                        f32_2 %32 = OpConstantComposite %30 %31 
                               Private f32_4* %34 = OpVariable Private 
                                 Private f32* %41 = OpVariable Private 
                                              %56 = OpTypeStruct %7 %7 %7 %7 %6 %7 %6 %7 
                                              %57 = OpTypePointer Uniform %56 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32; f32_4; f32; f32_4;}* %58 = OpVariable Uniform 
                                              %59 = OpTypeInt 32 1 
                                          i32 %60 = OpConstant 3 
                                              %61 = OpTypePointer Uniform %7 
                                              %68 = OpTypeInt 32 0 
                                          u32 %69 = OpConstant 1 
                                          u32 %72 = OpConstant 0 
                                              %79 = OpTypePointer Uniform %6 
                                              %84 = OpTypeBool 
                                              %85 = OpTypeVector %84 2 
                                              %86 = OpTypePointer Private %85 
                              Private bool_2* %87 = OpVariable Private 
                                          f32 %90 = OpConstant 3.674022E-40 
                                              %92 = OpTypePointer Private %84 
                                              %94 = OpTypeVector %6 3 
                                              %95 = OpTypePointer Private %94 
                               Private f32_3* %96 = OpVariable Private 
                                         f32 %103 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                              Private f32_4* %139 = OpVariable Private 
                             Private bool_2* %195 = OpVariable Private 
                                         i32 %203 = OpConstant 0 
                                         u32 %204 = OpConstant 2 
                                         i32 %243 = OpConstant 2 
                                         u32 %249 = OpConstant 3 
                                         i32 %270 = OpConstant 1 
                                         i32 %282 = OpConstant 7 
                               Private bool* %306 = OpVariable Private 
                                             %311 = OpTypePointer Function %6 
                               Private bool* %321 = OpVariable Private 
                                         i32 %336 = OpConstant 6 
        UniformConstant read_only Texture2D* %341 = OpVariable UniformConstant 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                       f32_4 %351 = OpConstantComposite %30 %30 %30 %30 
                                         i32 %353 = OpConstant 4 
                                         i32 %364 = OpConstant 5 
                                             %376 = OpTypePointer Output %7 
                               Output f32_4* %377 = OpVariable Output 
                                             %389 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %312 = OpVariable Function 
                               Function f32* %326 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_4 %23 = OpLoad vs_TEXCOORD2 
                                        f32_2 %24 = OpVectorShuffle %23 %23 2 3 
                                        f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                                      OpStore %9 %25 
                                        f32_4 %28 = OpLoad %9 
                                        f32_2 %29 = OpVectorShuffle %28 %28 2 3 
                                          f32 %33 = OpDot %29 %32 
                                                      OpStore %27 %33 
                          read_only Texture2D %35 = OpLoad %12 
                                      sampler %36 = OpLoad %16 
                   read_only Texture2DSampled %37 = OpSampledImage %35 %36 
                                        f32_4 %38 = OpLoad vs_TEXCOORD2 
                                        f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                        f32_4 %40 = OpImageSampleImplicitLod %37 %39 
                                                      OpStore %34 %40 
                                        f32_4 %42 = OpLoad %34 
                                        f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                          f32 %44 = OpDot %43 %32 
                                                      OpStore %41 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFNegate %46 
                                        f32_4 %48 = OpLoad %34 
                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                                        f32_2 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 2 3 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_2 %55 = OpExtInst %1 4 %54 
                               Uniform f32_4* %62 = OpAccessChain %58 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_2 %64 = OpVectorShuffle %63 %63 1 1 
                                        f32_2 %65 = OpFMul %55 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
                                                      OpStore %9 %67 
                                 Private f32* %70 = OpAccessChain %9 %69 
                                          f32 %71 = OpLoad %70 
                                 Private f32* %73 = OpAccessChain %9 %72 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFAdd %71 %74 
                                 Private f32* %76 = OpAccessChain %9 %72 
                                                      OpStore %76 %75 
                                 Private f32* %77 = OpAccessChain %9 %72 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %80 = OpAccessChain %58 %60 %69 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFMul %78 %81 
                                 Private f32* %83 = OpAccessChain %9 %72 
                                                      OpStore %83 %82 
                                 Private f32* %88 = OpAccessChain %9 %72 
                                          f32 %89 = OpLoad %88 
                                         bool %91 = OpFOrdLessThan %89 %90 
                                Private bool* %93 = OpAccessChain %87 %72 
                                                      OpStore %93 %91 
                                          f32 %97 = OpLoad %27 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpLoad %41 
                                         f32 %100 = OpFAdd %98 %99 
                                Private f32* %101 = OpAccessChain %96 %72 
                                                      OpStore %101 %100 
                                         f32 %102 = OpLoad %41 
                                         f32 %104 = OpFMul %102 %103 
                                                      OpStore %27 %104 
                                Private f32* %105 = OpAccessChain %96 %72 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpExtInst %1 4 %106 
                                Uniform f32* %108 = OpAccessChain %58 %60 %72 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                Private f32* %111 = OpAccessChain %96 %72 
                                                      OpStore %111 %110 
                                Private f32* %112 = OpAccessChain %96 %72 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpLoad %27 
                                        bool %115 = OpFOrdLessThan %113 %114 
                               Private bool* %116 = OpAccessChain %87 %69 
                                                      OpStore %116 %115 
                               Private bool* %117 = OpAccessChain %87 %72 
                                        bool %118 = OpLoad %117 
                                         f32 %120 = OpSelect %118 %30 %119 
                                Private f32* %121 = OpAccessChain %9 %72 
                                                      OpStore %121 %120 
                               Private bool* %122 = OpAccessChain %87 %69 
                                        bool %123 = OpLoad %122 
                                         f32 %124 = OpSelect %123 %30 %119 
                                Private f32* %125 = OpAccessChain %9 %69 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %9 %69 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %9 %72 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %9 %72 
                                                      OpStore %131 %130 
                         read_only Texture2D %132 = OpLoad %12 
                                     sampler %133 = OpLoad %16 
                  read_only Texture2DSampled %134 = OpSampledImage %132 %133 
                                       f32_4 %136 = OpLoad vs_TEXCOORD1 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                       f32_4 %138 = OpImageSampleImplicitLod %134 %137 
                                                      OpStore %34 %138 
                         read_only Texture2D %140 = OpLoad %12 
                                     sampler %141 = OpLoad %16 
                  read_only Texture2DSampled %142 = OpSampledImage %140 %141 
                                       f32_4 %143 = OpLoad vs_TEXCOORD1 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_4 %145 = OpImageSampleImplicitLod %142 %144 
                                                      OpStore %139 %145 
                                       f32_4 %146 = OpLoad %34 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_4 %148 = OpLoad %139 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_2 %150 = OpFNegate %149 
                                       f32_2 %151 = OpFAdd %147 %150 
                                       f32_3 %152 = OpLoad %96 
                                       f32_3 %153 = OpVectorShuffle %152 %151 3 4 2 
                                                      OpStore %96 %153 
                                       f32_4 %154 = OpLoad %34 
                                       f32_2 %155 = OpVectorShuffle %154 %154 2 3 
                                         f32 %156 = OpDot %155 %32 
                                                      OpStore %41 %156 
                                       f32_4 %157 = OpLoad %139 
                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
                                         f32 %159 = OpDot %158 %32 
                                Private f32* %160 = OpAccessChain %34 %72 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %41 
                                Private f32* %162 = OpAccessChain %34 %72 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFNegate %163 
                                         f32 %165 = OpFAdd %161 %164 
                                Private f32* %166 = OpAccessChain %34 %72 
                                                      OpStore %166 %165 
                                Private f32* %167 = OpAccessChain %34 %72 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpExtInst %1 4 %168 
                                Uniform f32* %170 = OpAccessChain %58 %60 %72 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %169 %171 
                                Private f32* %173 = OpAccessChain %34 %72 
                                                      OpStore %173 %172 
                                       f32_3 %174 = OpLoad %96 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                                       f32_2 %176 = OpExtInst %1 4 %175 
                              Uniform f32_4* %177 = OpAccessChain %58 %60 
                                       f32_4 %178 = OpLoad %177 
                                       f32_2 %179 = OpVectorShuffle %178 %178 1 1 
                                       f32_2 %180 = OpFMul %176 %179 
                                       f32_3 %181 = OpLoad %96 
                                       f32_3 %182 = OpVectorShuffle %181 %180 3 4 2 
                                                      OpStore %96 %182 
                                Private f32* %183 = OpAccessChain %96 %69 
                                         f32 %184 = OpLoad %183 
                                Private f32* %185 = OpAccessChain %96 %72 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %188 = OpAccessChain %96 %72 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %96 %72 
                                         f32 %190 = OpLoad %189 
                                Uniform f32* %191 = OpAccessChain %58 %60 %69 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %190 %192 
                                Private f32* %194 = OpAccessChain %96 %72 
                                                      OpStore %194 %193 
                                Private f32* %196 = OpAccessChain %96 %72 
                                         f32 %197 = OpLoad %196 
                                        bool %198 = OpFOrdLessThan %197 %90 
                               Private bool* %199 = OpAccessChain %195 %72 
                                                      OpStore %199 %198 
                                         f32 %200 = OpLoad %41 
                                         f32 %201 = OpFMul %200 %103 
                                                      OpStore %27 %201 
                                         f32 %202 = OpLoad %41 
                                Uniform f32* %205 = OpAccessChain %58 %203 %204 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFMul %202 %206 
                                Uniform f32* %208 = OpAccessChain %58 %203 %69 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFNegate %209 
                                         f32 %211 = OpFAdd %207 %210 
                                                      OpStore %41 %211 
                                Private f32* %212 = OpAccessChain %34 %72 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpLoad %27 
                                        bool %215 = OpFOrdLessThan %213 %214 
                               Private bool* %216 = OpAccessChain %195 %69 
                                                      OpStore %216 %215 
                               Private bool* %217 = OpAccessChain %195 %72 
                                        bool %218 = OpLoad %217 
                                         f32 %219 = OpSelect %218 %30 %119 
                                Private f32* %220 = OpAccessChain %96 %72 
                                                      OpStore %220 %219 
                               Private bool* %221 = OpAccessChain %195 %69 
                                        bool %222 = OpLoad %221 
                                         f32 %223 = OpSelect %222 %30 %119 
                                Private f32* %224 = OpAccessChain %96 %69 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %96 %69 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %96 %72 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFMul %226 %228 
                                Private f32* %230 = OpAccessChain %96 %72 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %96 %72 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                Private f32* %234 = OpAccessChain %9 %72 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                         f32 %237 = OpFAdd %236 %30 
                                Private f32* %238 = OpAccessChain %9 %72 
                                                      OpStore %238 %237 
                                         f32 %239 = OpLoad %41 
                                         f32 %240 = OpFNegate %239 
                                         f32 %241 = OpFAdd %240 %30 
                                Private f32* %242 = OpAccessChain %96 %72 
                                                      OpStore %242 %241 
                                Uniform f32* %244 = OpAccessChain %58 %243 %204 
                                         f32 %245 = OpLoad %244 
                                Private f32* %246 = OpAccessChain %96 %72 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFMul %245 %247 
                                Uniform f32* %250 = OpAccessChain %58 %243 %249 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpFAdd %248 %251 
                                Private f32* %253 = OpAccessChain %96 %72 
                                                      OpStore %253 %252 
                                Private f32* %254 = OpAccessChain %96 %72 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFNegate %255 
                                Uniform f32* %257 = OpAccessChain %58 %203 %249 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Uniform f32* %260 = OpAccessChain %58 %203 %204 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpFAdd %259 %261 
                                Private f32* %263 = OpAccessChain %96 %72 
                                                      OpStore %263 %262 
                                         f32 %264 = OpLoad %41 
                                         f32 %265 = OpFNegate %264 
                                Private f32* %266 = OpAccessChain %96 %72 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFAdd %265 %267 
                                Private f32* %269 = OpAccessChain %96 %72 
                                                      OpStore %269 %268 
                                Uniform f32* %271 = OpAccessChain %58 %270 %249 
                                         f32 %272 = OpLoad %271 
                                Private f32* %273 = OpAccessChain %96 %72 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %272 %274 
                                         f32 %276 = OpLoad %41 
                                         f32 %277 = OpFAdd %275 %276 
                                Private f32* %278 = OpAccessChain %96 %72 
                                                      OpStore %278 %277 
                                Private f32* %279 = OpAccessChain %96 %72 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFNegate %280 
                                Uniform f32* %283 = OpAccessChain %58 %282 %69 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpFAdd %281 %284 
                                Private f32* %286 = OpAccessChain %96 %72 
                                                      OpStore %286 %285 
                                Uniform f32* %287 = OpAccessChain %58 %282 %72 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFNegate %288 
                                Uniform f32* %290 = OpAccessChain %58 %282 %69 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFAdd %289 %291 
                                                      OpStore %27 %292 
                                Private f32* %293 = OpAccessChain %96 %72 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpLoad %27 
                                         f32 %296 = OpFDiv %294 %295 
                                Private f32* %297 = OpAccessChain %96 %72 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %96 %72 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %119 %30 
                                Private f32* %301 = OpAccessChain %96 %72 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %96 %72 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpFNegate %303 
                                         f32 %305 = OpFAdd %304 %30 
                                                      OpStore %27 %305 
                                Uniform f32* %307 = OpAccessChain %58 %282 %204 
                                         f32 %308 = OpLoad %307 
                                        bool %309 = OpFOrdEqual %308 %30 
                                                      OpStore %306 %309 
                                        bool %310 = OpLoad %306 
                                                      OpSelectionMerge %314 None 
                                                      OpBranchConditional %310 %313 %316 
                                             %313 = OpLabel 
                                         f32 %315 = OpLoad %27 
                                                      OpStore %312 %315 
                                                      OpBranch %314 
                                             %316 = OpLabel 
                                Private f32* %317 = OpAccessChain %96 %72 
                                         f32 %318 = OpLoad %317 
                                                      OpStore %312 %318 
                                                      OpBranch %314 
                                             %314 = OpLabel 
                                         f32 %319 = OpLoad %312 
                                Private f32* %320 = OpAccessChain %96 %72 
                                                      OpStore %320 %319 
                                Uniform f32* %322 = OpAccessChain %58 %282 %249 
                                         f32 %323 = OpLoad %322 
                                        bool %324 = OpFOrdNotEqual %323 %119 
                                                      OpStore %321 %324 
                                        bool %325 = OpLoad %321 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %325 %327 %331 
                                             %327 = OpLabel 
                                Private f32* %329 = OpAccessChain %96 %72 
                                         f32 %330 = OpLoad %329 
                                                      OpStore %326 %330 
                                                      OpBranch %328 
                                             %331 = OpLabel 
                                                      OpStore %326 %30 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                         f32 %332 = OpLoad %326 
                                Private f32* %333 = OpAccessChain %96 %72 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %96 %72 
                                         f32 %335 = OpLoad %334 
                                Uniform f32* %337 = OpAccessChain %58 %336 
                                         f32 %338 = OpLoad %337 
                                         f32 %339 = OpFMul %335 %338 
                                Private f32* %340 = OpAccessChain %96 %72 
                                                      OpStore %340 %339 
                         read_only Texture2D %342 = OpLoad %341 
                                     sampler %343 = OpLoad %16 
                  read_only Texture2DSampled %344 = OpSampledImage %342 %343 
                                       f32_4 %346 = OpLoad vs_TEXCOORD0 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_4 %348 = OpImageSampleImplicitLod %344 %347 
                                                      OpStore %34 %348 
                                       f32_4 %349 = OpLoad %34 
                                       f32_4 %350 = OpFNegate %349 
                                       f32_4 %352 = OpFAdd %350 %351 
                                                      OpStore %139 %352 
                                Uniform f32* %354 = OpAccessChain %58 %353 
                                         f32 %355 = OpLoad %354 
                                       f32_4 %356 = OpCompositeConstruct %355 %355 %355 %355 
                                       f32_4 %357 = OpLoad %139 
                                       f32_4 %358 = OpFMul %356 %357 
                                       f32_4 %359 = OpLoad %34 
                                       f32_4 %360 = OpFAdd %358 %359 
                                                      OpStore %34 %360 
                                       f32_4 %361 = OpLoad %34 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFNegate %362 
                              Uniform f32_4* %365 = OpAccessChain %58 %364 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFAdd %363 %367 
                                       f32_4 %369 = OpLoad %139 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %139 %370 
                                       f32_3 %371 = OpLoad %96 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 0 0 
                                       f32_4 %373 = OpLoad %139 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpFMul %372 %374 
                                                      OpStore %96 %375 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 0 0 
                                       f32_3 %380 = OpLoad %96 
                                       f32_3 %381 = OpFMul %379 %380 
                                       f32_4 %382 = OpLoad %34 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_3 %384 = OpFAdd %381 %383 
                                       f32_4 %385 = OpLoad %377 
                                       f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                      OpStore %377 %386 
                                Private f32* %387 = OpAccessChain %34 %249 
                                         f32 %388 = OpLoad %387 
                                 Output f32* %390 = OpAccessChain %377 %249 
                                                      OpStore %390 %388 
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
  Name "Edge Detection: Sobel"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 177241
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _EdgeSize;
in  vec3 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0 = in_POSITION0.xyxy + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD0 = u_xlat1;
    vs_TEXCOORD3.xy = u_xlat1.zw * vec2(_RenderViewportScaleFactor);
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_EdgeSize, _EdgeSize));
    u_xlat1.xy = u_xlat0.xy * vec2(-1.0, 1.0);
    vs_TEXCOORD1.zw = u_xlat0.zw * vec2(0.5, 0.5) + u_xlat1.xy;
    vs_TEXCOORD2.xy = u_xlat0.zw * vec2(0.5, 0.5) + (-u_xlat1.xy);
    vs_TEXCOORD1.xy = u_xlat0.zw * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD2.zw = u_xlat0.zw * vec2(0.5, 0.5) + (-u_xlat0.xy);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BackgroundFade;
uniform 	float _EdgeSize;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeOpacity;
uniform 	float _Exponent;
uniform 	vec4 _FadeParams;
uniform 	vec4 _SobelParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(vec4(_EdgeSize, _EdgeSize, _EdgeSize, _EdgeSize));
    u_xlat1 = u_xlat0.zwxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = (-u_xlat0) * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat1 = texture(_CameraDepthTexture, u_xlat1.zw);
    u_xlat1.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat7 = u_xlat2.x * _ZBufferParams.x;
    u_xlat13 = (-unity_OrthoParams.w) * u_xlat7 + 1.0;
    u_xlat19 = (-unity_OrthoParams.w) + 1.0;
    u_xlat7 = u_xlat19 * u_xlat7 + _ZBufferParams.y;
    u_xlat2.x = u_xlat13 / u_xlat7;
    u_xlat3 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.zw);
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat6 = u_xlat3.x * _ZBufferParams.x;
    u_xlat12 = (-unity_OrthoParams.w) * u_xlat6 + 1.0;
    u_xlat6 = u_xlat19 * u_xlat6 + _ZBufferParams.y;
    u_xlat2.y = u_xlat12 / u_xlat6;
    u_xlat6 = (-unity_OrthoParams.w) * u_xlat1.x + 1.0;
    u_xlat12 = u_xlat19 * u_xlat1.x + _ZBufferParams.y;
    u_xlat2.z = u_xlat6 / u_xlat12;
    u_xlat6 = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat19 * u_xlat0.x + _ZBufferParams.y;
    u_xlat2.w = u_xlat6 / u_xlat0.x;
    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat6 = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat19 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat6 / u_xlat0.x;
    u_xlatb3 = lessThan(u_xlat0.xxxx, u_xlat2);
    u_xlat3.x = (u_xlatb3.x) ? u_xlat2.x : u_xlat0.x;
    u_xlat3.y = (u_xlatb3.y) ? u_xlat2.y : u_xlat0.x;
    u_xlat3.z = (u_xlatb3.z) ? u_xlat2.z : u_xlat0.x;
    u_xlat3.w = (u_xlatb3.w) ? u_xlat2.w : u_xlat0.x;
    u_xlatb6 = _SobelParams.x==1.0;
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat3 : u_xlat2;
    u_xlat2 = u_xlat2 / u_xlat0.xxxx;
    u_xlat3 = u_xlat2 * vec4(0.0, 1.0, -1.0, 0.0);
    u_xlat2 = u_xlat2 * vec4(1.0, 0.0, 0.0, -1.0);
    u_xlat4 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat12 = u_xlat4.x * _ZBufferParams.x;
    u_xlat18 = (-unity_OrthoParams.w) * u_xlat12 + 1.0;
    u_xlat12 = u_xlat19 * u_xlat12 + _ZBufferParams.y;
    u_xlat4.x = u_xlat18 / u_xlat12;
    u_xlat5 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw);
    u_xlat12 = u_xlat5.x * _ZBufferParams.x;
    u_xlat18 = (-unity_OrthoParams.w) * u_xlat12 + 1.0;
    u_xlat12 = u_xlat19 * u_xlat12 + _ZBufferParams.y;
    u_xlat4.y = u_xlat18 / u_xlat12;
    u_xlat5 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy);
    u_xlat12 = u_xlat5.x * _ZBufferParams.x;
    u_xlat18 = u_xlat19 * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = (-unity_OrthoParams.w) * u_xlat12 + 1.0;
    u_xlat4.z = u_xlat12 / u_xlat18;
    u_xlat5 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw);
    u_xlat12 = u_xlat5.x * _ZBufferParams.x;
    u_xlat18 = u_xlat19 * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = (-unity_OrthoParams.w) * u_xlat12 + 1.0;
    u_xlat4.w = u_xlat12 / u_xlat18;
    u_xlatb1 = lessThan(u_xlat0.xxxx, u_xlat4);
    u_xlat1.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat0.x;
    u_xlat1.y = (u_xlatb1.y) ? u_xlat4.y : u_xlat0.x;
    u_xlat1.z = (u_xlatb1.z) ? u_xlat4.z : u_xlat0.x;
    u_xlat1.w = (u_xlatb1.w) ? u_xlat4.w : u_xlat0.x;
    u_xlat1 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat4;
    u_xlat1 = (-u_xlat0.xxxx) + u_xlat1;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat3 = u_xlat1 * vec4(-1.0, 1.0, -1.0, 1.0) + u_xlat3;
    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, -1.0) + u_xlat2;
    u_xlat6 = dot(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat12 = dot(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat6 = u_xlat6 * u_xlat6 + u_xlat12;
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = min(u_xlat6, 1.0);
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _Exponent;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat12 = (-u_xlat6) + 1.0;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_OrthoParams.w);
    u_xlat6 = (u_xlatb18) ? u_xlat12 : u_xlat6;
    u_xlat12 = (-u_xlat0.x) + 1.0;
    u_xlat12 = _ZBufferParams.z * u_xlat12 + _ZBufferParams.w;
    u_xlat12 = (-u_xlat12) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat12 = (-u_xlat0.x) + u_xlat12;
    u_xlat0.x = unity_OrthoParams.w * u_xlat12 + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + _FadeParams.y;
    u_xlat12 = (-_FadeParams.x) + _FadeParams.y;
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = (-u_xlat0.x) + 1.0;
    u_xlatb18 = _FadeParams.z==1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat12 : u_xlat0.x;
    u_xlatb12 = _FadeParams.w!=0.0;
    u_xlat0.x = (u_xlatb12) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlat0.x * _EdgeOpacity;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(_BackgroundFade) * u_xlat2 + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) + _EdgeColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xzw + u_xlat1.xyz;
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
; Bound: 138
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %47 %96 %125 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD0 Location 45 
                                             OpDecorate vs_TEXCOORD1 Location 47 
                                             OpMemberDecorate %48 0 Offset 48 
                                             OpMemberDecorate %48 1 Offset 48 
                                             OpMemberDecorate %48 2 Offset 48 
                                             OpDecorate %48 Block 
                                             OpDecorate %50 DescriptorSet 50 
                                             OpDecorate %50 Binding 50 
                                             OpDecorate vs_TEXCOORD2 Location 96 
                                             OpDecorate vs_TEXCOORD3 Location 125 
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
                                     %32 = OpTypePointer Private %7 
                      Private f32_4* %33 = OpVariable Private 
                               f32_4 %36 = OpConstantComposite %27 %27 %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_4 %41 = OpConstantComposite %39 %40 %39 %40 
                               f32_4 %43 = OpConstantComposite %26 %27 %26 %27 
              Output f32_4* vs_TEXCOORD0 = OpVariable Output 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                     %48 = OpTypeStruct %6 %7 %6 
                                     %49 = OpTypePointer Uniform %48 
  Uniform struct {f32; f32_4; f32;}* %50 = OpVariable Uniform 
                                 i32 %51 = OpConstant 2 
                                     %52 = OpTypePointer Uniform %6 
                                 i32 %61 = OpConstant 1 
                                     %62 = OpTypePointer Uniform %7 
                                 f32 %88 = OpConstant 3.674022E-40 
                               f32_2 %89 = OpConstantComposite %88 %27 
              Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                    %124 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD3 = OpVariable Output 
                                    %132 = OpTypePointer Output %6 
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
                               f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
                               f32_4 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_4 %38 = OpLoad %33 
                               f32_4 %42 = OpFMul %38 %41 
                               f32_4 %44 = OpFAdd %42 %43 
                                             OpStore %33 %44 
                               f32_4 %46 = OpLoad %33 
                                             OpStore vs_TEXCOORD0 %46 
                        Uniform f32* %53 = OpAccessChain %50 %51 
                                 f32 %54 = OpLoad %53 
                        Uniform f32* %55 = OpAccessChain %50 %51 
                                 f32 %56 = OpLoad %55 
                               f32_2 %57 = OpCompositeConstruct %54 %56 
                                 f32 %58 = OpCompositeExtract %57 0 
                                 f32 %59 = OpCompositeExtract %57 1 
                               f32_2 %60 = OpCompositeConstruct %58 %59 
                      Uniform f32_4* %63 = OpAccessChain %50 %61 
                               f32_4 %64 = OpLoad %63 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                               f32_2 %66 = OpFMul %60 %65 
                               f32_4 %67 = OpLoad %33 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_2 %69 = OpFAdd %66 %68 
                               f32_4 %70 = OpLoad vs_TEXCOORD1 
                               f32_4 %71 = OpVectorShuffle %70 %69 4 5 2 3 
                                             OpStore vs_TEXCOORD1 %71 
                      Uniform f32_4* %72 = OpAccessChain %50 %61 
                               f32_4 %73 = OpLoad %72 
                               f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                        Uniform f32* %75 = OpAccessChain %50 %51 
                                 f32 %76 = OpLoad %75 
                        Uniform f32* %77 = OpAccessChain %50 %51 
                                 f32 %78 = OpLoad %77 
                               f32_2 %79 = OpCompositeConstruct %76 %78 
                                 f32 %80 = OpCompositeExtract %79 0 
                                 f32 %81 = OpCompositeExtract %79 1 
                               f32_2 %82 = OpCompositeConstruct %80 %81 
                               f32_2 %83 = OpFMul %74 %82 
                               f32_4 %84 = OpLoad %33 
                               f32_4 %85 = OpVectorShuffle %84 %83 4 5 2 3 
                                             OpStore %33 %85 
                               f32_4 %86 = OpLoad %33 
                               f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                               f32_2 %90 = OpFMul %87 %89 
                               f32_4 %91 = OpLoad %33 
                               f32_2 %92 = OpVectorShuffle %91 %91 2 3 
                               f32_2 %93 = OpFAdd %90 %92 
                               f32_4 %94 = OpLoad vs_TEXCOORD1 
                               f32_4 %95 = OpVectorShuffle %94 %93 0 1 4 5 
                                             OpStore vs_TEXCOORD1 %95 
                               f32_4 %97 = OpLoad %33 
                               f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                               f32_2 %99 = OpFNegate %98 
                              f32_2 %100 = OpFMul %99 %89 
                              f32_4 %101 = OpLoad %33 
                              f32_2 %102 = OpVectorShuffle %101 %101 2 3 
                              f32_2 %103 = OpFAdd %100 %102 
                              f32_4 %104 = OpLoad vs_TEXCOORD2 
                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 2 3 
                                             OpStore vs_TEXCOORD2 %105 
                       Uniform f32* %106 = OpAccessChain %50 %51 
                                f32 %107 = OpLoad %106 
                       Uniform f32* %108 = OpAccessChain %50 %51 
                                f32 %109 = OpLoad %108 
                              f32_2 %110 = OpCompositeConstruct %107 %109 
                                f32 %111 = OpCompositeExtract %110 0 
                                f32 %112 = OpCompositeExtract %110 1 
                              f32_2 %113 = OpCompositeConstruct %111 %112 
                              f32_2 %114 = OpFNegate %113 
                     Uniform f32_4* %115 = OpAccessChain %50 %61 
                              f32_4 %116 = OpLoad %115 
                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                              f32_2 %118 = OpFMul %114 %117 
                              f32_4 %119 = OpLoad %33 
                              f32_2 %120 = OpVectorShuffle %119 %119 2 3 
                              f32_2 %121 = OpFAdd %118 %120 
                              f32_4 %122 = OpLoad vs_TEXCOORD2 
                              f32_4 %123 = OpVectorShuffle %122 %121 0 1 4 5 
                                             OpStore vs_TEXCOORD2 %123 
                              f32_4 %126 = OpLoad %33 
                              f32_2 %127 = OpVectorShuffle %126 %126 2 3 
                       Uniform f32* %128 = OpAccessChain %50 %15 
                                f32 %129 = OpLoad %128 
                              f32_2 %130 = OpCompositeConstruct %129 %129 
                              f32_2 %131 = OpFMul %127 %130 
                                             OpStore vs_TEXCOORD3 %131 
                        Output f32* %133 = OpAccessChain %13 %15 %9 
                                f32 %134 = OpLoad %133 
                                f32 %135 = OpFNegate %134 
                        Output f32* %136 = OpAccessChain %13 %15 %9 
                                             OpStore %136 %135 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 709
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %44 %325 %382 %693 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 44 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %61 DescriptorSet 61 
                                                      OpDecorate %61 Binding 61 
                                                      OpDecorate vs_TEXCOORD1 Location 325 
                                                      OpDecorate vs_TEXCOORD2 Location 382 
                                                      OpDecorate %656 DescriptorSet 656 
                                                      OpDecorate %656 Binding 656 
                                                      OpDecorate %693 Location 693 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %7 %7 %7 %6 %6 %7 %6 %6 %7 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32; f32; f32_4; f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 3 
                                              %15 = OpTypePointer Uniform %7 
                                          i32 %19 = OpConstant 5 
                                              %20 = OpTypePointer Uniform %6 
                               Private f32_4* %36 = OpVariable Private 
                                          f32 %39 = OpConstant 3.674022E-40 
                                          f32 %40 = OpConstant 3.674022E-40 
                                        f32_4 %41 = OpConstantComposite %39 %40 %40 %39 
                                              %43 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                        f32_4 %50 = OpConstantComposite %40 %39 %39 %40 
                                              %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %56 = OpTypePointer UniformConstant %55 
         UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
                                              %59 = OpTypeSampler 
                                              %60 = OpTypePointer UniformConstant %59 
                     UniformConstant sampler* %61 = OpVariable UniformConstant 
                                              %63 = OpTypeSampledImage %55 
                                              %65 = OpTypeVector %6 2 
                                              %69 = OpTypeInt 32 0 
                                          u32 %70 = OpConstant 0 
                                              %72 = OpTypePointer Private %6 
                                          u32 %81 = OpConstant 1 
                                          i32 %85 = OpConstant 2 
                                 Private f32* %92 = OpVariable Private 
                                          i32 %93 = OpConstant 1 
                                          u32 %94 = OpConstant 3 
                                Private f32* %102 = OpVariable Private 
                              Private f32_4* %115 = OpVariable Private 
                                Private f32* %145 = OpVariable Private 
                                         u32 %185 = OpConstant 2 
                                Private f32* %195 = OpVariable Private 
                                             %242 = OpTypeBool 
                                             %243 = OpTypeVector %242 4 
                                             %244 = OpTypePointer Private %243 
                             Private bool_4* %245 = OpVariable Private 
                              Private f32_4* %250 = OpVariable Private 
                                             %251 = OpTypePointer Private %242 
                                             %254 = OpTypePointer Function %6 
                               Private bool* %301 = OpVariable Private 
                                         i32 %302 = OpConstant 10 
                                         f32 %316 = OpConstant 3.674022E-40 
                                       f32_4 %317 = OpConstantComposite %39 %40 %316 %39 
                                       f32_4 %320 = OpConstantComposite %40 %39 %39 %316 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                Private f32* %334 = OpVariable Private 
                              Private f32_4* %347 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                             Private bool_4* %434 = OpVariable Private 
                                         i32 %499 = OpConstant 0 
                                       f32_4 %509 = OpConstantComposite %316 %40 %316 %40 
                                       f32_4 %514 = OpConstantComposite %40 %40 %316 %316 
                                       f32_4 %519 = OpConstantComposite %40 %40 %40 %40 
                                         i32 %538 = OpConstant 8 
                               Private bool* %553 = OpVariable Private 
                                       f32_4 %554 = OpConstantComposite %39 %39 %39 %39 
                                         i32 %599 = OpConstant 9 
                               Private bool* %636 = OpVariable Private 
                                         i32 %651 = OpConstant 7 
        UniformConstant read_only Texture2D* %656 = OpVariable UniformConstant 
                                         i32 %666 = OpConstant 4 
                                             %674 = OpTypeVector %6 3 
                                         i32 %678 = OpConstant 6 
                                             %692 = OpTypePointer Output %7 
                               Output f32_4* %693 = OpVariable Output 
                                             %706 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %255 = OpVariable Function 
                               Function f32* %267 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                               Function f32* %441 = OpVariable Function 
                               Function f32* %453 = OpVariable Function 
                               Function f32* %465 = OpVariable Function 
                               Function f32* %477 = OpVariable Function 
                               Function f32* %627 = OpVariable Function 
                               Function f32* %641 = OpVariable Function 
                               Uniform f32_4* %16 = OpAccessChain %12 %14 
                                        f32_4 %17 = OpLoad %16 
                                        f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
                                 Uniform f32* %21 = OpAccessChain %12 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %23 = OpAccessChain %12 %19 
                                          f32 %24 = OpLoad %23 
                                 Uniform f32* %25 = OpAccessChain %12 %19 
                                          f32 %26 = OpLoad %25 
                                 Uniform f32* %27 = OpAccessChain %12 %19 
                                          f32 %28 = OpLoad %27 
                                        f32_4 %29 = OpCompositeConstruct %22 %24 %26 %28 
                                          f32 %30 = OpCompositeExtract %29 0 
                                          f32 %31 = OpCompositeExtract %29 1 
                                          f32 %32 = OpCompositeExtract %29 2 
                                          f32 %33 = OpCompositeExtract %29 3 
                                        f32_4 %34 = OpCompositeConstruct %30 %31 %32 %33 
                                        f32_4 %35 = OpFMul %18 %34 
                                                      OpStore %9 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %37 2 3 0 1 
                                        f32_4 %42 = OpFMul %38 %41 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
                                        f32_4 %47 = OpFAdd %42 %46 
                                                      OpStore %36 %47 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpFNegate %48 
                                        f32_4 %51 = OpFMul %49 %50 
                                        f32_4 %52 = OpLoad vs_TEXCOORD0 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
                                        f32_4 %54 = OpFAdd %51 %53 
                                                      OpStore %9 %54 
                          read_only Texture2D %58 = OpLoad %57 
                                      sampler %62 = OpLoad %61 
                   read_only Texture2DSampled %64 = OpSampledImage %58 %62 
                                        f32_4 %66 = OpLoad %36 
                                        f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                        f32_4 %68 = OpImageSampleImplicitLod %64 %67 
                                          f32 %71 = OpCompositeExtract %68 0 
                                 Private f32* %73 = OpAccessChain %36 %70 
                                                      OpStore %73 %71 
                          read_only Texture2D %74 = OpLoad %57 
                                      sampler %75 = OpLoad %61 
                   read_only Texture2DSampled %76 = OpSampledImage %74 %75 
                                        f32_4 %77 = OpLoad %36 
                                        f32_2 %78 = OpVectorShuffle %77 %77 2 3 
                                        f32_4 %79 = OpImageSampleImplicitLod %76 %78 
                                          f32 %80 = OpCompositeExtract %79 0 
                                 Private f32* %82 = OpAccessChain %36 %81 
                                                      OpStore %82 %80 
                                        f32_4 %83 = OpLoad %36 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                               Uniform f32_4* %86 = OpAccessChain %12 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 0 
                                        f32_2 %89 = OpFMul %84 %88 
                                        f32_4 %90 = OpLoad %36 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %36 %91 
                                 Uniform f32* %95 = OpAccessChain %12 %93 %94 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFNegate %96 
                                 Private f32* %98 = OpAccessChain %36 %70 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                         f32 %101 = OpFAdd %100 %40 
                                                      OpStore %92 %101 
                                Uniform f32* %103 = OpAccessChain %12 %93 %94 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                         f32 %106 = OpFAdd %105 %40 
                                                      OpStore %102 %106 
                                         f32 %107 = OpLoad %102 
                                Private f32* %108 = OpAccessChain %36 %70 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                Uniform f32* %111 = OpAccessChain %12 %85 %81 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFAdd %110 %112 
                                Private f32* %114 = OpAccessChain %36 %70 
                                                      OpStore %114 %113 
                                         f32 %116 = OpLoad %92 
                                Private f32* %117 = OpAccessChain %36 %70 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFDiv %116 %118 
                                Private f32* %120 = OpAccessChain %115 %70 
                                                      OpStore %120 %119 
                         read_only Texture2D %121 = OpLoad %57 
                                     sampler %122 = OpLoad %61 
                  read_only Texture2DSampled %123 = OpSampledImage %121 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_4 %126 = OpImageSampleImplicitLod %123 %125 
                                         f32 %127 = OpCompositeExtract %126 0 
                                Private f32* %128 = OpAccessChain %9 %70 
                                                      OpStore %128 %127 
                         read_only Texture2D %129 = OpLoad %57 
                                     sampler %130 = OpLoad %61 
                  read_only Texture2DSampled %131 = OpSampledImage %129 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_2 %133 = OpVectorShuffle %132 %132 2 3 
                                       f32_4 %134 = OpImageSampleImplicitLod %131 %133 
                                         f32 %135 = OpCompositeExtract %134 0 
                                Private f32* %136 = OpAccessChain %9 %81 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                              Uniform f32_4* %139 = OpAccessChain %12 %85 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 0 
                                       f32_2 %142 = OpFMul %138 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
                                                      OpStore %9 %144 
                                Uniform f32* %146 = OpAccessChain %12 %93 %94 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFNegate %147 
                                Private f32* %149 = OpAccessChain %9 %70 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %148 %150 
                                         f32 %152 = OpFAdd %151 %40 
                                                      OpStore %145 %152 
                                         f32 %153 = OpLoad %102 
                                Private f32* %154 = OpAccessChain %9 %70 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Uniform f32* %157 = OpAccessChain %12 %85 %81 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %9 %70 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %145 
                                Private f32* %162 = OpAccessChain %9 %70 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFDiv %161 %163 
                                Private f32* %165 = OpAccessChain %115 %81 
                                                      OpStore %165 %164 
                                Uniform f32* %166 = OpAccessChain %12 %93 %94 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                Private f32* %169 = OpAccessChain %36 %81 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFMul %168 %170 
                                         f32 %172 = OpFAdd %171 %40 
                                Private f32* %173 = OpAccessChain %9 %70 
                                                      OpStore %173 %172 
                                         f32 %174 = OpLoad %102 
                                Private f32* %175 = OpAccessChain %36 %81 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFMul %174 %176 
                                Uniform f32* %178 = OpAccessChain %12 %85 %81 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFAdd %177 %179 
                                                      OpStore %145 %180 
                                Private f32* %181 = OpAccessChain %9 %70 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpLoad %145 
                                         f32 %184 = OpFDiv %182 %183 
                                Private f32* %186 = OpAccessChain %115 %185 
                                                      OpStore %186 %184 
                                Uniform f32* %187 = OpAccessChain %12 %93 %94 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                Private f32* %190 = OpAccessChain %9 %81 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFMul %189 %191 
                                         f32 %193 = OpFAdd %192 %40 
                                Private f32* %194 = OpAccessChain %9 %70 
                                                      OpStore %194 %193 
                                         f32 %196 = OpLoad %102 
                                Private f32* %197 = OpAccessChain %9 %81 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Uniform f32* %200 = OpAccessChain %12 %85 %81 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                                      OpStore %195 %202 
                                Private f32* %203 = OpAccessChain %9 %70 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpLoad %195 
                                         f32 %206 = OpFDiv %204 %205 
                                Private f32* %207 = OpAccessChain %115 %94 
                                                      OpStore %207 %206 
                         read_only Texture2D %208 = OpLoad %57 
                                     sampler %209 = OpLoad %61 
                  read_only Texture2DSampled %210 = OpSampledImage %208 %209 
                                       f32_4 %211 = OpLoad vs_TEXCOORD0 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 0 
                                Private f32* %215 = OpAccessChain %9 %70 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %9 %70 
                                         f32 %217 = OpLoad %216 
                                Uniform f32* %218 = OpAccessChain %12 %85 %70 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                Private f32* %221 = OpAccessChain %9 %70 
                                                      OpStore %221 %220 
                                Uniform f32* %222 = OpAccessChain %12 %93 %94 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFNegate %223 
                                Private f32* %225 = OpAccessChain %9 %70 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %224 %226 
                                         f32 %228 = OpFAdd %227 %40 
                                                      OpStore %195 %228 
                                         f32 %229 = OpLoad %102 
                                Private f32* %230 = OpAccessChain %9 %70 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFMul %229 %231 
                                Uniform f32* %233 = OpAccessChain %12 %85 %81 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpFAdd %232 %234 
                                Private f32* %236 = OpAccessChain %9 %70 
                                                      OpStore %236 %235 
                                         f32 %237 = OpLoad %195 
                                Private f32* %238 = OpAccessChain %9 %70 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFDiv %237 %239 
                                Private f32* %241 = OpAccessChain %9 %70 
                                                      OpStore %241 %240 
                                       f32_4 %246 = OpLoad %9 
                                       f32_4 %247 = OpVectorShuffle %246 %246 0 0 0 0 
                                       f32_4 %248 = OpLoad %115 
                                      bool_4 %249 = OpFOrdLessThan %247 %248 
                                                      OpStore %245 %249 
                               Private bool* %252 = OpAccessChain %245 %70 
                                        bool %253 = OpLoad %252 
                                                      OpSelectionMerge %257 None 
                                                      OpBranchConditional %253 %256 %260 
                                             %256 = OpLabel 
                                Private f32* %258 = OpAccessChain %115 %70 
                                         f32 %259 = OpLoad %258 
                                                      OpStore %255 %259 
                                                      OpBranch %257 
                                             %260 = OpLabel 
                                Private f32* %261 = OpAccessChain %9 %70 
                                         f32 %262 = OpLoad %261 
                                                      OpStore %255 %262 
                                                      OpBranch %257 
                                             %257 = OpLabel 
                                         f32 %263 = OpLoad %255 
                                Private f32* %264 = OpAccessChain %250 %70 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %245 %81 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %269 None 
                                                      OpBranchConditional %266 %268 %272 
                                             %268 = OpLabel 
                                Private f32* %270 = OpAccessChain %115 %81 
                                         f32 %271 = OpLoad %270 
                                                      OpStore %267 %271 
                                                      OpBranch %269 
                                             %272 = OpLabel 
                                Private f32* %273 = OpAccessChain %9 %70 
                                         f32 %274 = OpLoad %273 
                                                      OpStore %267 %274 
                                                      OpBranch %269 
                                             %269 = OpLabel 
                                         f32 %275 = OpLoad %267 
                                Private f32* %276 = OpAccessChain %250 %81 
                                                      OpStore %276 %275 
                               Private bool* %277 = OpAccessChain %245 %185 
                                        bool %278 = OpLoad %277 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %278 %280 %284 
                                             %280 = OpLabel 
                                Private f32* %282 = OpAccessChain %115 %185 
                                         f32 %283 = OpLoad %282 
                                                      OpStore %279 %283 
                                                      OpBranch %281 
                                             %284 = OpLabel 
                                Private f32* %285 = OpAccessChain %9 %70 
                                         f32 %286 = OpLoad %285 
                                                      OpStore %279 %286 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %287 = OpLoad %279 
                                Private f32* %288 = OpAccessChain %250 %185 
                                                      OpStore %288 %287 
                               Private bool* %289 = OpAccessChain %245 %94 
                                        bool %290 = OpLoad %289 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %290 %292 %296 
                                             %292 = OpLabel 
                                Private f32* %294 = OpAccessChain %115 %94 
                                         f32 %295 = OpLoad %294 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                Private f32* %297 = OpAccessChain %9 %70 
                                         f32 %298 = OpLoad %297 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                         f32 %299 = OpLoad %291 
                                Private f32* %300 = OpAccessChain %250 %94 
                                                      OpStore %300 %299 
                                Uniform f32* %303 = OpAccessChain %12 %302 %70 
                                         f32 %304 = OpLoad %303 
                                        bool %305 = OpFOrdEqual %304 %40 
                                                      OpStore %301 %305 
                                        bool %306 = OpLoad %301 
                                       f32_4 %307 = OpLoad %250 
                                       f32_4 %308 = OpLoad %115 
                                      bool_4 %309 = OpCompositeConstruct %306 %306 %306 %306 
                                       f32_4 %310 = OpSelect %309 %307 %308 
                                                      OpStore %115 %310 
                                       f32_4 %311 = OpLoad %115 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpVectorShuffle %312 %312 0 0 0 0 
                                       f32_4 %314 = OpFDiv %311 %313 
                                                      OpStore %115 %314 
                                       f32_4 %315 = OpLoad %115 
                                       f32_4 %318 = OpFMul %315 %317 
                                                      OpStore %250 %318 
                                       f32_4 %319 = OpLoad %115 
                                       f32_4 %321 = OpFMul %319 %320 
                                                      OpStore %115 %321 
                         read_only Texture2D %322 = OpLoad %57 
                                     sampler %323 = OpLoad %61 
                  read_only Texture2DSampled %324 = OpSampledImage %322 %323 
                                       f32_4 %326 = OpLoad vs_TEXCOORD1 
                                       f32_2 %327 = OpVectorShuffle %326 %326 0 1 
                                       f32_4 %328 = OpImageSampleImplicitLod %324 %327 
                                         f32 %329 = OpCompositeExtract %328 0 
                                                      OpStore %145 %329 
                                         f32 %330 = OpLoad %145 
                                Uniform f32* %331 = OpAccessChain %12 %85 %70 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFMul %330 %332 
                                                      OpStore %145 %333 
                                Uniform f32* %335 = OpAccessChain %12 %93 %94 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFNegate %336 
                                         f32 %338 = OpLoad %145 
                                         f32 %339 = OpFMul %337 %338 
                                         f32 %340 = OpFAdd %339 %40 
                                                      OpStore %334 %340 
                                         f32 %341 = OpLoad %102 
                                         f32 %342 = OpLoad %145 
                                         f32 %343 = OpFMul %341 %342 
                                Uniform f32* %344 = OpAccessChain %12 %85 %81 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %343 %345 
                                                      OpStore %145 %346 
                                         f32 %348 = OpLoad %334 
                                         f32 %349 = OpLoad %145 
                                         f32 %350 = OpFDiv %348 %349 
                                Private f32* %351 = OpAccessChain %347 %70 
                                                      OpStore %351 %350 
                         read_only Texture2D %352 = OpLoad %57 
                                     sampler %353 = OpLoad %61 
                  read_only Texture2DSampled %354 = OpSampledImage %352 %353 
                                       f32_4 %355 = OpLoad vs_TEXCOORD1 
                                       f32_2 %356 = OpVectorShuffle %355 %355 2 3 
                                       f32_4 %357 = OpImageSampleImplicitLod %354 %356 
                                         f32 %358 = OpCompositeExtract %357 0 
                                                      OpStore %145 %358 
                                         f32 %359 = OpLoad %145 
                                Uniform f32* %360 = OpAccessChain %12 %85 %70 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFMul %359 %361 
                                                      OpStore %145 %362 
                                Uniform f32* %363 = OpAccessChain %12 %93 %94 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFNegate %364 
                                         f32 %366 = OpLoad %145 
                                         f32 %367 = OpFMul %365 %366 
                                         f32 %368 = OpFAdd %367 %40 
                                                      OpStore %334 %368 
                                         f32 %369 = OpLoad %102 
                                         f32 %370 = OpLoad %145 
                                         f32 %371 = OpFMul %369 %370 
                                Uniform f32* %372 = OpAccessChain %12 %85 %81 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFAdd %371 %373 
                                                      OpStore %145 %374 
                                         f32 %375 = OpLoad %334 
                                         f32 %376 = OpLoad %145 
                                         f32 %377 = OpFDiv %375 %376 
                                Private f32* %378 = OpAccessChain %347 %81 
                                                      OpStore %378 %377 
                         read_only Texture2D %379 = OpLoad %57 
                                     sampler %380 = OpLoad %61 
                  read_only Texture2DSampled %381 = OpSampledImage %379 %380 
                                       f32_4 %383 = OpLoad vs_TEXCOORD2 
                                       f32_2 %384 = OpVectorShuffle %383 %383 0 1 
                                       f32_4 %385 = OpImageSampleImplicitLod %381 %384 
                                         f32 %386 = OpCompositeExtract %385 0 
                                                      OpStore %145 %386 
                                         f32 %387 = OpLoad %145 
                                Uniform f32* %388 = OpAccessChain %12 %85 %70 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFMul %387 %389 
                                                      OpStore %145 %390 
                                         f32 %391 = OpLoad %102 
                                         f32 %392 = OpLoad %145 
                                         f32 %393 = OpFMul %391 %392 
                                Uniform f32* %394 = OpAccessChain %12 %85 %81 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpFAdd %393 %395 
                                                      OpStore %334 %396 
                                Uniform f32* %397 = OpAccessChain %12 %93 %94 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFNegate %398 
                                         f32 %400 = OpLoad %145 
                                         f32 %401 = OpFMul %399 %400 
                                         f32 %402 = OpFAdd %401 %40 
                                                      OpStore %145 %402 
                                         f32 %403 = OpLoad %145 
                                         f32 %404 = OpLoad %334 
                                         f32 %405 = OpFDiv %403 %404 
                                Private f32* %406 = OpAccessChain %347 %185 
                                                      OpStore %406 %405 
                         read_only Texture2D %407 = OpLoad %57 
                                     sampler %408 = OpLoad %61 
                  read_only Texture2DSampled %409 = OpSampledImage %407 %408 
                                       f32_4 %410 = OpLoad vs_TEXCOORD2 
                                       f32_2 %411 = OpVectorShuffle %410 %410 2 3 
                                       f32_4 %412 = OpImageSampleImplicitLod %409 %411 
                                         f32 %413 = OpCompositeExtract %412 0 
                                                      OpStore %145 %413 
                                         f32 %414 = OpLoad %145 
                                Uniform f32* %415 = OpAccessChain %12 %85 %70 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFMul %414 %416 
                                                      OpStore %145 %417 
                                         f32 %418 = OpLoad %102 
                                         f32 %419 = OpLoad %145 
                                         f32 %420 = OpFMul %418 %419 
                                Uniform f32* %421 = OpAccessChain %12 %85 %81 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %334 %423 
                                Uniform f32* %424 = OpAccessChain %12 %93 %94 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpFNegate %425 
                                         f32 %427 = OpLoad %145 
                                         f32 %428 = OpFMul %426 %427 
                                         f32 %429 = OpFAdd %428 %40 
                                                      OpStore %145 %429 
                                         f32 %430 = OpLoad %145 
                                         f32 %431 = OpLoad %334 
                                         f32 %432 = OpFDiv %430 %431 
                                Private f32* %433 = OpAccessChain %347 %94 
                                                      OpStore %433 %432 
                                       f32_4 %435 = OpLoad %9 
                                       f32_4 %436 = OpVectorShuffle %435 %435 0 0 0 0 
                                       f32_4 %437 = OpLoad %347 
                                      bool_4 %438 = OpFOrdLessThan %436 %437 
                                                      OpStore %434 %438 
                               Private bool* %439 = OpAccessChain %434 %70 
                                        bool %440 = OpLoad %439 
                                                      OpSelectionMerge %443 None 
                                                      OpBranchConditional %440 %442 %446 
                                             %442 = OpLabel 
                                Private f32* %444 = OpAccessChain %347 %70 
                                         f32 %445 = OpLoad %444 
                                                      OpStore %441 %445 
                                                      OpBranch %443 
                                             %446 = OpLabel 
                                Private f32* %447 = OpAccessChain %9 %70 
                                         f32 %448 = OpLoad %447 
                                                      OpStore %441 %448 
                                                      OpBranch %443 
                                             %443 = OpLabel 
                                         f32 %449 = OpLoad %441 
                                Private f32* %450 = OpAccessChain %36 %70 
                                                      OpStore %450 %449 
                               Private bool* %451 = OpAccessChain %434 %81 
                                        bool %452 = OpLoad %451 
                                                      OpSelectionMerge %455 None 
                                                      OpBranchConditional %452 %454 %458 
                                             %454 = OpLabel 
                                Private f32* %456 = OpAccessChain %347 %81 
                                         f32 %457 = OpLoad %456 
                                                      OpStore %453 %457 
                                                      OpBranch %455 
                                             %458 = OpLabel 
                                Private f32* %459 = OpAccessChain %9 %70 
                                         f32 %460 = OpLoad %459 
                                                      OpStore %453 %460 
                                                      OpBranch %455 
                                             %455 = OpLabel 
                                         f32 %461 = OpLoad %453 
                                Private f32* %462 = OpAccessChain %36 %81 
                                                      OpStore %462 %461 
                               Private bool* %463 = OpAccessChain %434 %185 
                                        bool %464 = OpLoad %463 
                                                      OpSelectionMerge %467 None 
                                                      OpBranchConditional %464 %466 %470 
                                             %466 = OpLabel 
                                Private f32* %468 = OpAccessChain %347 %185 
                                         f32 %469 = OpLoad %468 
                                                      OpStore %465 %469 
                                                      OpBranch %467 
                                             %470 = OpLabel 
                                Private f32* %471 = OpAccessChain %9 %70 
                                         f32 %472 = OpLoad %471 
                                                      OpStore %465 %472 
                                                      OpBranch %467 
                                             %467 = OpLabel 
                                         f32 %473 = OpLoad %465 
                                Private f32* %474 = OpAccessChain %36 %185 
                                                      OpStore %474 %473 
                               Private bool* %475 = OpAccessChain %434 %94 
                                        bool %476 = OpLoad %475 
                                                      OpSelectionMerge %479 None 
                                                      OpBranchConditional %476 %478 %482 
                                             %478 = OpLabel 
                                Private f32* %480 = OpAccessChain %347 %94 
                                         f32 %481 = OpLoad %480 
                                                      OpStore %477 %481 
                                                      OpBranch %479 
                                             %482 = OpLabel 
                                Private f32* %483 = OpAccessChain %9 %70 
                                         f32 %484 = OpLoad %483 
                                                      OpStore %477 %484 
                                                      OpBranch %479 
                                             %479 = OpLabel 
                                         f32 %485 = OpLoad %477 
                                Private f32* %486 = OpAccessChain %36 %94 
                                                      OpStore %486 %485 
                                        bool %487 = OpLoad %301 
                                       f32_4 %488 = OpLoad %36 
                                       f32_4 %489 = OpLoad %347 
                                      bool_4 %490 = OpCompositeConstruct %487 %487 %487 %487 
                                       f32_4 %491 = OpSelect %490 %488 %489 
                                                      OpStore %36 %491 
                                       f32_4 %492 = OpLoad %9 
                                       f32_4 %493 = OpVectorShuffle %492 %492 0 0 0 0 
                                       f32_4 %494 = OpFNegate %493 
                                       f32_4 %495 = OpLoad %36 
                                       f32_4 %496 = OpFAdd %494 %495 
                                                      OpStore %36 %496 
                                Private f32* %497 = OpAccessChain %9 %70 
                                         f32 %498 = OpLoad %497 
                                Uniform f32* %500 = OpAccessChain %12 %499 %185 
                                         f32 %501 = OpLoad %500 
                                         f32 %502 = OpFMul %498 %501 
                                Uniform f32* %503 = OpAccessChain %12 %499 %81 
                                         f32 %504 = OpLoad %503 
                                         f32 %505 = OpFNegate %504 
                                         f32 %506 = OpFAdd %502 %505 
                                Private f32* %507 = OpAccessChain %9 %70 
                                                      OpStore %507 %506 
                                       f32_4 %508 = OpLoad %36 
                                       f32_4 %510 = OpFMul %508 %509 
                                       f32_4 %511 = OpLoad %250 
                                       f32_4 %512 = OpFAdd %510 %511 
                                                      OpStore %250 %512 
                                       f32_4 %513 = OpLoad %36 
                                       f32_4 %515 = OpFMul %513 %514 
                                       f32_4 %516 = OpLoad %115 
                                       f32_4 %517 = OpFAdd %515 %516 
                                                      OpStore %36 %517 
                                       f32_4 %518 = OpLoad %36 
                                         f32 %520 = OpDot %518 %519 
                                                      OpStore %195 %520 
                                       f32_4 %521 = OpLoad %250 
                                         f32 %522 = OpDot %521 %519 
                                                      OpStore %145 %522 
                                         f32 %523 = OpLoad %145 
                                         f32 %524 = OpLoad %145 
                                         f32 %525 = OpFMul %523 %524 
                                                      OpStore %145 %525 
                                         f32 %526 = OpLoad %195 
                                         f32 %527 = OpLoad %195 
                                         f32 %528 = OpFMul %526 %527 
                                         f32 %529 = OpLoad %145 
                                         f32 %530 = OpFAdd %528 %529 
                                                      OpStore %195 %530 
                                         f32 %531 = OpLoad %195 
                                         f32 %532 = OpExtInst %1 31 %531 
                                                      OpStore %195 %532 
                                         f32 %533 = OpLoad %195 
                                         f32 %534 = OpExtInst %1 37 %533 %40 
                                                      OpStore %195 %534 
                                         f32 %535 = OpLoad %195 
                                         f32 %536 = OpExtInst %1 30 %535 
                                                      OpStore %195 %536 
                                         f32 %537 = OpLoad %195 
                                Uniform f32* %539 = OpAccessChain %12 %538 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpFMul %537 %540 
                                                      OpStore %195 %541 
                                         f32 %542 = OpLoad %195 
                                         f32 %543 = OpExtInst %1 29 %542 
                                                      OpStore %195 %543 
                                         f32 %544 = OpLoad %195 
                                         f32 %545 = OpFNegate %544 
                                         f32 %546 = OpFAdd %545 %40 
                                                      OpStore %195 %546 
                                         f32 %547 = OpLoad %195 
                                         f32 %548 = OpFNegate %547 
                                         f32 %549 = OpFAdd %548 %40 
                                                      OpStore %195 %549 
                                         f32 %550 = OpLoad %195 
                                         f32 %551 = OpFNegate %550 
                                         f32 %552 = OpFAdd %551 %40 
                                                      OpStore %145 %552 
                                Uniform f32* %555 = OpAccessChain %12 %93 %94 
                                         f32 %556 = OpLoad %555 
                                       f32_4 %557 = OpCompositeConstruct %556 %556 %556 %556 
                                      bool_4 %558 = OpFOrdNotEqual %554 %557 
                                        bool %559 = OpAny %558 
                                                      OpStore %553 %559 
                                        bool %560 = OpLoad %553 
                                         f32 %561 = OpLoad %145 
                                         f32 %562 = OpLoad %195 
                                         f32 %563 = OpSelect %560 %561 %562 
                                                      OpStore %195 %563 
                                Private f32* %564 = OpAccessChain %9 %70 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFNegate %565 
                                         f32 %567 = OpFAdd %566 %40 
                                                      OpStore %145 %567 
                                Uniform f32* %568 = OpAccessChain %12 %85 %185 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpLoad %145 
                                         f32 %571 = OpFMul %569 %570 
                                Uniform f32* %572 = OpAccessChain %12 %85 %94 
                                         f32 %573 = OpLoad %572 
                                         f32 %574 = OpFAdd %571 %573 
                                                      OpStore %145 %574 
                                         f32 %575 = OpLoad %145 
                                         f32 %576 = OpFNegate %575 
                                Uniform f32* %577 = OpAccessChain %12 %499 %94 
                                         f32 %578 = OpLoad %577 
                                         f32 %579 = OpFMul %576 %578 
                                Uniform f32* %580 = OpAccessChain %12 %499 %185 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpFAdd %579 %581 
                                                      OpStore %145 %582 
                                Private f32* %583 = OpAccessChain %9 %70 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFNegate %584 
                                         f32 %586 = OpLoad %145 
                                         f32 %587 = OpFAdd %585 %586 
                                                      OpStore %145 %587 
                                Uniform f32* %588 = OpAccessChain %12 %93 %94 
                                         f32 %589 = OpLoad %588 
                                         f32 %590 = OpLoad %145 
                                         f32 %591 = OpFMul %589 %590 
                                Private f32* %592 = OpAccessChain %9 %70 
                                         f32 %593 = OpLoad %592 
                                         f32 %594 = OpFAdd %591 %593 
                                Private f32* %595 = OpAccessChain %9 %70 
                                                      OpStore %595 %594 
                                Private f32* %596 = OpAccessChain %9 %70 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFNegate %597 
                                Uniform f32* %600 = OpAccessChain %12 %599 %81 
                                         f32 %601 = OpLoad %600 
                                         f32 %602 = OpFAdd %598 %601 
                                Private f32* %603 = OpAccessChain %9 %70 
                                                      OpStore %603 %602 
                                Uniform f32* %604 = OpAccessChain %12 %599 %70 
                                         f32 %605 = OpLoad %604 
                                         f32 %606 = OpFNegate %605 
                                Uniform f32* %607 = OpAccessChain %12 %599 %81 
                                         f32 %608 = OpLoad %607 
                                         f32 %609 = OpFAdd %606 %608 
                                                      OpStore %145 %609 
                                Private f32* %610 = OpAccessChain %9 %70 
                                         f32 %611 = OpLoad %610 
                                         f32 %612 = OpLoad %145 
                                         f32 %613 = OpFDiv %611 %612 
                                Private f32* %614 = OpAccessChain %9 %70 
                                                      OpStore %614 %613 
                                Private f32* %615 = OpAccessChain %9 %70 
                                         f32 %616 = OpLoad %615 
                                         f32 %617 = OpExtInst %1 43 %616 %39 %40 
                                Private f32* %618 = OpAccessChain %9 %70 
                                                      OpStore %618 %617 
                                Private f32* %619 = OpAccessChain %9 %70 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFNegate %620 
                                         f32 %622 = OpFAdd %621 %40 
                                                      OpStore %145 %622 
                                Uniform f32* %623 = OpAccessChain %12 %599 %185 
                                         f32 %624 = OpLoad %623 
                                        bool %625 = OpFOrdEqual %624 %40 
                                                      OpStore %553 %625 
                                        bool %626 = OpLoad %553 
                                                      OpSelectionMerge %629 None 
                                                      OpBranchConditional %626 %628 %631 
                                             %628 = OpLabel 
                                         f32 %630 = OpLoad %145 
                                                      OpStore %627 %630 
                                                      OpBranch %629 
                                             %631 = OpLabel 
                                Private f32* %632 = OpAccessChain %9 %70 
                                         f32 %633 = OpLoad %632 
                                                      OpStore %627 %633 
                                                      OpBranch %629 
                                             %629 = OpLabel 
                                         f32 %634 = OpLoad %627 
                                Private f32* %635 = OpAccessChain %9 %70 
                                                      OpStore %635 %634 
                                Uniform f32* %637 = OpAccessChain %12 %599 %94 
                                         f32 %638 = OpLoad %637 
                                        bool %639 = OpFOrdNotEqual %638 %39 
                                                      OpStore %636 %639 
                                        bool %640 = OpLoad %636 
                                                      OpSelectionMerge %643 None 
                                                      OpBranchConditional %640 %642 %646 
                                             %642 = OpLabel 
                                Private f32* %644 = OpAccessChain %9 %70 
                                         f32 %645 = OpLoad %644 
                                                      OpStore %641 %645 
                                                      OpBranch %643 
                                             %646 = OpLabel 
                                                      OpStore %641 %40 
                                                      OpBranch %643 
                                             %643 = OpLabel 
                                         f32 %647 = OpLoad %641 
                                Private f32* %648 = OpAccessChain %9 %70 
                                                      OpStore %648 %647 
                                Private f32* %649 = OpAccessChain %9 %70 
                                         f32 %650 = OpLoad %649 
                                Uniform f32* %652 = OpAccessChain %12 %651 
                                         f32 %653 = OpLoad %652 
                                         f32 %654 = OpFMul %650 %653 
                                Private f32* %655 = OpAccessChain %9 %70 
                                                      OpStore %655 %654 
                         read_only Texture2D %657 = OpLoad %656 
                                     sampler %658 = OpLoad %61 
                  read_only Texture2DSampled %659 = OpSampledImage %657 %658 
                                       f32_4 %660 = OpLoad vs_TEXCOORD0 
                                       f32_2 %661 = OpVectorShuffle %660 %660 0 1 
                                       f32_4 %662 = OpImageSampleImplicitLod %659 %661 
                                                      OpStore %36 %662 
                                       f32_4 %663 = OpLoad %36 
                                       f32_4 %664 = OpFNegate %663 
                                       f32_4 %665 = OpFAdd %664 %519 
                                                      OpStore %115 %665 
                                Uniform f32* %667 = OpAccessChain %12 %666 
                                         f32 %668 = OpLoad %667 
                                       f32_4 %669 = OpCompositeConstruct %668 %668 %668 %668 
                                       f32_4 %670 = OpLoad %115 
                                       f32_4 %671 = OpFMul %669 %670 
                                       f32_4 %672 = OpLoad %36 
                                       f32_4 %673 = OpFAdd %671 %672 
                                                      OpStore %36 %673 
                                       f32_4 %675 = OpLoad %36 
                                       f32_3 %676 = OpVectorShuffle %675 %675 0 1 2 
                                       f32_3 %677 = OpFNegate %676 
                              Uniform f32_4* %679 = OpAccessChain %12 %678 
                                       f32_4 %680 = OpLoad %679 
                                       f32_3 %681 = OpVectorShuffle %680 %680 0 1 2 
                                       f32_3 %682 = OpFAdd %677 %681 
                                       f32_4 %683 = OpLoad %115 
                                       f32_4 %684 = OpVectorShuffle %683 %682 4 5 6 3 
                                                      OpStore %115 %684 
                                       f32_4 %685 = OpLoad %9 
                                       f32_3 %686 = OpVectorShuffle %685 %685 0 0 0 
                                       f32_4 %687 = OpLoad %115 
                                       f32_3 %688 = OpVectorShuffle %687 %687 0 1 2 
                                       f32_3 %689 = OpFMul %686 %688 
                                       f32_4 %690 = OpLoad %9 
                                       f32_4 %691 = OpVectorShuffle %690 %689 4 1 5 6 
                                                      OpStore %9 %691 
                                         f32 %694 = OpLoad %195 
                                       f32_3 %695 = OpCompositeConstruct %694 %694 %694 
                                       f32_4 %696 = OpLoad %9 
                                       f32_3 %697 = OpVectorShuffle %696 %696 0 2 3 
                                       f32_3 %698 = OpFMul %695 %697 
                                       f32_4 %699 = OpLoad %36 
                                       f32_3 %700 = OpVectorShuffle %699 %699 0 1 2 
                                       f32_3 %701 = OpFAdd %698 %700 
                                       f32_4 %702 = OpLoad %693 
                                       f32_4 %703 = OpVectorShuffle %702 %701 4 5 6 3 
                                                      OpStore %693 %703 
                                Private f32* %704 = OpAccessChain %36 %94 
                                         f32 %705 = OpLoad %704 
                                 Output f32* %707 = OpAccessChain %693 %94 
                                                      OpStore %707 %705 
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
  Name "Edge Detection: Luminance"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 246700
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _EdgeSize;
in  vec3 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat8;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0 = in_POSITION0.xyxy + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD0 = u_xlat1;
    u_xlat8.x = _MainTex_TexelSize.x * _EdgeSize;
    u_xlat8.y = (-_MainTex_TexelSize.y) * _EdgeSize;
    vs_TEXCOORD1.zw = u_xlat0.zw * vec2(0.5, 0.5) + u_xlat8.xy;
    vs_TEXCOORD1.xy = (-_MainTex_TexelSize.xy) * vec2(vec2(_EdgeSize, _EdgeSize)) + u_xlat1.zw;
    vs_TEXCOORD2.xy = u_xlat1.zw * vec2(_RenderViewportScaleFactor);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	float _BackgroundFade;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeOpacity;
uniform 	float _Threshold;
uniform 	vec4 _FadeParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = (-unity_OrthoParams.w) + 1.0;
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + _ZBufferParams.y;
    u_xlat4.x = (-unity_OrthoParams.w) * u_xlat4.x + 1.0;
    u_xlat0.x = u_xlat4.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = (-u_xlat4.x) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat4.x;
    u_xlat0.x = unity_OrthoParams.w * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + _FadeParams.y;
    u_xlat4.x = (-_FadeParams.x) + _FadeParams.y;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlatb8 = _FadeParams.z==1.0;
    u_xlat0.x = (u_xlatb8) ? u_xlat4.x : u_xlat0.x;
    u_xlatb4 = _FadeParams.w!=0.0;
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlat0.x * _EdgeOpacity;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(_BackgroundFade) * u_xlat2 + u_xlat1;
    u_xlat4.xyz = (-u_xlat2.xyz) + _EdgeColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + (-u_xlat3.xyz);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.zw);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat3.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb12 = _Threshold>=u_xlat12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %70 %97 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD0 Location 45 
                                             OpMemberDecorate %49 0 Offset 49 
                                             OpMemberDecorate %49 1 Offset 49 
                                             OpMemberDecorate %49 2 Offset 49 
                                             OpDecorate %49 Block 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate vs_TEXCOORD1 Location 70 
                                             OpDecorate vs_TEXCOORD2 Location 97 
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
                                     %32 = OpTypePointer Private %7 
                      Private f32_4* %33 = OpVariable Private 
                               f32_4 %36 = OpConstantComposite %27 %27 %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_4 %41 = OpConstantComposite %39 %40 %39 %40 
                               f32_4 %43 = OpConstantComposite %26 %27 %26 %27 
              Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                     %47 = OpTypePointer Private %19 
                      Private f32_2* %48 = OpVariable Private 
                                     %49 = OpTypeStruct %6 %7 %6 
                                     %50 = OpTypePointer Uniform %49 
  Uniform struct {f32; f32_4; f32;}* %51 = OpVariable Uniform 
                                 i32 %52 = OpConstant 1 
                                 u32 %53 = OpConstant 0 
                                     %54 = OpTypePointer Uniform %6 
                                 i32 %57 = OpConstant 2 
                                     %61 = OpTypePointer Private %6 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                     %77 = OpTypePointer Uniform %7 
                                     %96 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                    %104 = OpTypePointer Output %6 
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
                               f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
                               f32_4 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_4 %38 = OpLoad %33 
                               f32_4 %42 = OpFMul %38 %41 
                               f32_4 %44 = OpFAdd %42 %43 
                                             OpStore %33 %44 
                               f32_4 %46 = OpLoad %33 
                                             OpStore vs_TEXCOORD0 %46 
                        Uniform f32* %55 = OpAccessChain %51 %52 %53 
                                 f32 %56 = OpLoad %55 
                        Uniform f32* %58 = OpAccessChain %51 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFMul %56 %59 
                        Private f32* %62 = OpAccessChain %48 %53 
                                             OpStore %62 %60 
                        Uniform f32* %63 = OpAccessChain %51 %52 %9 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFNegate %64 
                        Uniform f32* %66 = OpAccessChain %51 %57 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpFMul %65 %67 
                        Private f32* %69 = OpAccessChain %48 %9 
                                             OpStore %69 %68 
                               f32_4 %71 = OpLoad %33 
                               f32_2 %72 = OpVectorShuffle %71 %71 2 3 
                               f32_2 %73 = OpLoad %48 
                               f32_2 %74 = OpFAdd %72 %73 
                               f32_4 %75 = OpLoad vs_TEXCOORD1 
                               f32_4 %76 = OpVectorShuffle %75 %74 0 1 4 5 
                                             OpStore vs_TEXCOORD1 %76 
                      Uniform f32_4* %78 = OpAccessChain %51 %52 
                               f32_4 %79 = OpLoad %78 
                               f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                               f32_2 %81 = OpFNegate %80 
                        Uniform f32* %82 = OpAccessChain %51 %57 
                                 f32 %83 = OpLoad %82 
                        Uniform f32* %84 = OpAccessChain %51 %57 
                                 f32 %85 = OpLoad %84 
                               f32_2 %86 = OpCompositeConstruct %83 %85 
                                 f32 %87 = OpCompositeExtract %86 0 
                                 f32 %88 = OpCompositeExtract %86 1 
                               f32_2 %89 = OpCompositeConstruct %87 %88 
                               f32_2 %90 = OpFMul %81 %89 
                               f32_4 %91 = OpLoad %33 
                               f32_2 %92 = OpVectorShuffle %91 %91 2 3 
                               f32_2 %93 = OpFAdd %90 %92 
                               f32_4 %94 = OpLoad vs_TEXCOORD1 
                               f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                             OpStore vs_TEXCOORD1 %95 
                               f32_4 %98 = OpLoad %33 
                               f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                       Uniform f32* %100 = OpAccessChain %51 %15 
                                f32 %101 = OpLoad %100 
                              f32_2 %102 = OpCompositeConstruct %101 %101 
                              f32_2 %103 = OpFMul %99 %102 
                                             OpStore vs_TEXCOORD2 %103 
                        Output f32* %105 = OpAccessChain %13 %15 %9 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFNegate %106 
                        Output f32* %108 = OpAccessChain %13 %15 %9 
                                             OpStore %108 %107 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 308
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %39 %249 %293 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate vs_TEXCOORD1 Location 249 
                                                      OpDecorate %293 Location 293 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %10 %10 %10 %6 %10 %6 %6 %10 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32_4; f32; f32_4; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.674022E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                               Private f32_3* %27 = OpVariable Private 
                                              %28 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %29 = OpTypePointer UniformConstant %28 
         UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
                                              %32 = OpTypeSampler 
                                              %33 = OpTypePointer UniformConstant %32 
                     UniformConstant sampler* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampledImage %28 
                                              %38 = OpTypePointer Input %10 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                              %40 = OpTypeVector %6 2 
                                          i32 %48 = OpConstant 2 
                                          u32 %58 = OpConstant 1 
                                          i32 %79 = OpConstant 0 
                                          u32 %80 = OpConstant 2 
                                         i32 %132 = OpConstant 7 
                                         f32 %152 = OpConstant 3.674022E-40 
                                             %160 = OpTypeBool 
                                             %161 = OpTypePointer Private %160 
                               Private bool* %162 = OpVariable Private 
                                             %167 = OpTypePointer Function %6 
                               Private bool* %178 = OpVariable Private 
                                         i32 %193 = OpConstant 5 
                                             %198 = OpTypePointer Private %10 
                              Private f32_4* %199 = OpVariable Private 
        UniformConstant read_only Texture2D* %200 = OpVariable UniformConstant 
                              Private f32_4* %207 = OpVariable Private 
                                       f32_4 %210 = OpConstantComposite %22 %22 %22 %22 
                                         i32 %212 = OpConstant 3 
                                         i32 %223 = OpConstant 4 
                                             %224 = OpTypePointer Uniform %10 
                              Private f32_3* %245 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         f32 %256 = OpConstant 3.674022E-40 
                                       f32_3 %257 = OpConstantComposite %256 %256 %256 
                                Private f32* %278 = OpVariable Private 
                               Private bool* %284 = OpVariable Private 
                                         i32 %285 = OpConstant 6 
                                             %292 = OpTypePointer Output %10 
                               Output f32_4* %293 = OpVariable Output 
                                             %305 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %168 = OpVariable Function 
                               Function f32* %183 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFNegate %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                          read_only Texture2D %31 = OpLoad %30 
                                      sampler %35 = OpLoad %34 
                   read_only Texture2DSampled %37 = OpSampledImage %31 %35 
                                        f32_4 %41 = OpLoad vs_TEXCOORD0 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                        f32_4 %43 = OpImageSampleImplicitLod %37 %42 
                                          f32 %44 = OpCompositeExtract %43 0 
                                 Private f32* %45 = OpAccessChain %27 %24 
                                                      OpStore %45 %44 
                                 Private f32* %46 = OpAccessChain %27 %24 
                                          f32 %47 = OpLoad %46 
                                 Uniform f32* %49 = OpAccessChain %13 %48 %24 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %47 %50 
                                 Private f32* %52 = OpAccessChain %27 %24 
                                                      OpStore %52 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                 Private f32* %55 = OpAccessChain %27 %24 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFMul %54 %56 
                                 Uniform f32* %59 = OpAccessChain %13 %48 %58 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFAdd %57 %60 
                                 Private f32* %62 = OpAccessChain %9 %24 
                                                      OpStore %62 %61 
                                 Uniform f32* %63 = OpAccessChain %13 %15 %17 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFNegate %64 
                                 Private f32* %66 = OpAccessChain %27 %24 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %65 %67 
                                          f32 %69 = OpFAdd %68 %22 
                                 Private f32* %70 = OpAccessChain %27 %24 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %27 %24 
                                          f32 %72 = OpLoad %71 
                                 Private f32* %73 = OpAccessChain %9 %24 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFDiv %72 %74 
                                 Private f32* %76 = OpAccessChain %9 %24 
                                                      OpStore %76 %75 
                                 Private f32* %77 = OpAccessChain %9 %24 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %81 = OpAccessChain %13 %79 %80 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFMul %78 %82 
                                 Uniform f32* %84 = OpAccessChain %13 %79 %58 
                                          f32 %85 = OpLoad %84 
                                          f32 %86 = OpFNegate %85 
                                          f32 %87 = OpFAdd %83 %86 
                                 Private f32* %88 = OpAccessChain %9 %24 
                                                      OpStore %88 %87 
                                 Private f32* %89 = OpAccessChain %9 %24 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFNegate %90 
                                          f32 %92 = OpFAdd %91 %22 
                                 Private f32* %93 = OpAccessChain %27 %24 
                                                      OpStore %93 %92 
                                 Uniform f32* %94 = OpAccessChain %13 %48 %80 
                                          f32 %95 = OpLoad %94 
                                 Private f32* %96 = OpAccessChain %27 %24 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %95 %97 
                                 Uniform f32* %99 = OpAccessChain %13 %48 %17 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                Private f32* %102 = OpAccessChain %27 %24 
                                                      OpStore %102 %101 
                                Private f32* %103 = OpAccessChain %27 %24 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                Uniform f32* %106 = OpAccessChain %13 %79 %17 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFMul %105 %107 
                                Uniform f32* %109 = OpAccessChain %13 %79 %80 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                Private f32* %112 = OpAccessChain %27 %24 
                                                      OpStore %112 %111 
                                Private f32* %113 = OpAccessChain %9 %24 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFNegate %114 
                                Private f32* %116 = OpAccessChain %27 %24 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %27 %24 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %13 %15 %17 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %27 %24 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %9 %24 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %9 %24 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %24 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFNegate %130 
                                Uniform f32* %133 = OpAccessChain %13 %132 %58 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFAdd %131 %134 
                                Private f32* %136 = OpAccessChain %9 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %137 = OpAccessChain %13 %132 %24 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFNegate %138 
                                Uniform f32* %140 = OpAccessChain %13 %132 %58 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFAdd %139 %141 
                                Private f32* %143 = OpAccessChain %27 %24 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %9 %24 
                                         f32 %145 = OpLoad %144 
                                Private f32* %146 = OpAccessChain %27 %24 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFDiv %145 %147 
                                Private f32* %149 = OpAccessChain %9 %24 
                                                      OpStore %149 %148 
                                Private f32* %150 = OpAccessChain %9 %24 
                                         f32 %151 = OpLoad %150 
                                         f32 %153 = OpExtInst %1 43 %151 %152 %22 
                                Private f32* %154 = OpAccessChain %9 %24 
                                                      OpStore %154 %153 
                                Private f32* %155 = OpAccessChain %9 %24 
                                         f32 %156 = OpLoad %155 
                                         f32 %157 = OpFNegate %156 
                                         f32 %158 = OpFAdd %157 %22 
                                Private f32* %159 = OpAccessChain %27 %24 
                                                      OpStore %159 %158 
                                Uniform f32* %163 = OpAccessChain %13 %132 %80 
                                         f32 %164 = OpLoad %163 
                                        bool %165 = OpFOrdEqual %164 %22 
                                                      OpStore %162 %165 
                                        bool %166 = OpLoad %162 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %166 %169 %173 
                                             %169 = OpLabel 
                                Private f32* %171 = OpAccessChain %27 %24 
                                         f32 %172 = OpLoad %171 
                                                      OpStore %168 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                Private f32* %174 = OpAccessChain %9 %24 
                                         f32 %175 = OpLoad %174 
                                                      OpStore %168 %175 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                         f32 %176 = OpLoad %168 
                                Private f32* %177 = OpAccessChain %9 %24 
                                                      OpStore %177 %176 
                                Uniform f32* %179 = OpAccessChain %13 %132 %17 
                                         f32 %180 = OpLoad %179 
                                        bool %181 = OpFOrdNotEqual %180 %152 
                                                      OpStore %178 %181 
                                        bool %182 = OpLoad %178 
                                                      OpSelectionMerge %185 None 
                                                      OpBranchConditional %182 %184 %188 
                                             %184 = OpLabel 
                                Private f32* %186 = OpAccessChain %9 %24 
                                         f32 %187 = OpLoad %186 
                                                      OpStore %183 %187 
                                                      OpBranch %185 
                                             %188 = OpLabel 
                                                      OpStore %183 %22 
                                                      OpBranch %185 
                                             %185 = OpLabel 
                                         f32 %189 = OpLoad %183 
                                Private f32* %190 = OpAccessChain %9 %24 
                                                      OpStore %190 %189 
                                Private f32* %191 = OpAccessChain %9 %24 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %194 = OpAccessChain %13 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %192 %195 
                                Private f32* %197 = OpAccessChain %9 %24 
                                                      OpStore %197 %196 
                         read_only Texture2D %201 = OpLoad %200 
                                     sampler %202 = OpLoad %34 
                  read_only Texture2DSampled %203 = OpSampledImage %201 %202 
                                       f32_4 %204 = OpLoad vs_TEXCOORD0 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 1 
                                       f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                                      OpStore %199 %206 
                                       f32_4 %208 = OpLoad %199 
                                       f32_4 %209 = OpFNegate %208 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %207 %211 
                                Uniform f32* %213 = OpAccessChain %13 %212 
                                         f32 %214 = OpLoad %213 
                                       f32_4 %215 = OpCompositeConstruct %214 %214 %214 %214 
                                       f32_4 %216 = OpLoad %207 
                                       f32_4 %217 = OpFMul %215 %216 
                                       f32_4 %218 = OpLoad %199 
                                       f32_4 %219 = OpFAdd %217 %218 
                                                      OpStore %207 %219 
                                       f32_4 %220 = OpLoad %207 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFNegate %221 
                              Uniform f32_4* %225 = OpAccessChain %13 %223 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_3 %228 = OpFAdd %222 %227 
                                                      OpStore %27 %228 
                                       f32_3 %229 = OpLoad %9 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 0 0 
                                       f32_3 %231 = OpLoad %27 
                                       f32_3 %232 = OpFMul %230 %231 
                                       f32_4 %233 = OpLoad %207 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                       f32_3 %235 = OpFAdd %232 %234 
                                                      OpStore %9 %235 
                                       f32_3 %236 = OpLoad %9 
                                       f32_3 %237 = OpCompositeConstruct %152 %152 %152 
                                       f32_3 %238 = OpCompositeConstruct %22 %22 %22 
                                       f32_3 %239 = OpExtInst %1 43 %236 %237 %238 
                                                      OpStore %9 %239 
                                       f32_4 %240 = OpLoad %207 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpFNegate %241 
                                       f32_3 %243 = OpLoad %9 
                                       f32_3 %244 = OpFAdd %242 %243 
                                                      OpStore %9 %244 
                         read_only Texture2D %246 = OpLoad %200 
                                     sampler %247 = OpLoad %34 
                  read_only Texture2DSampled %248 = OpSampledImage %246 %247 
                                       f32_4 %250 = OpLoad vs_TEXCOORD1 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                                       f32_4 %252 = OpImageSampleImplicitLod %248 %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                                      OpStore %245 %253 
                                       f32_4 %254 = OpLoad %199 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                       f32_3 %259 = OpLoad %245 
                                       f32_3 %260 = OpFNegate %259 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %199 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %199 %263 
                         read_only Texture2D %264 = OpLoad %200 
                                     sampler %265 = OpLoad %34 
                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
                                       f32_4 %267 = OpLoad vs_TEXCOORD1 
                                       f32_2 %268 = OpVectorShuffle %267 %267 2 3 
                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                                      OpStore %245 %270 
                                       f32_4 %271 = OpLoad %199 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpLoad %245 
                                       f32_3 %274 = OpFNegate %273 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %199 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %199 %277 
                                       f32_4 %279 = OpLoad %199 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_4 %281 = OpLoad %199 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                         f32 %283 = OpDot %280 %282 
                                                      OpStore %278 %283 
                                Uniform f32* %286 = OpAccessChain %13 %285 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpLoad %278 
                                        bool %289 = OpFOrdGreaterThanEqual %287 %288 
                                                      OpStore %284 %289 
                                        bool %290 = OpLoad %284 
                                         f32 %291 = OpSelect %290 %152 %22 
                                                      OpStore %278 %291 
                                         f32 %294 = OpLoad %278 
                                       f32_3 %295 = OpCompositeConstruct %294 %294 %294 
                                       f32_3 %296 = OpLoad %9 
                                       f32_3 %297 = OpFMul %295 %296 
                                       f32_4 %298 = OpLoad %207 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_3 %300 = OpFAdd %297 %299 
                                       f32_4 %301 = OpLoad %293 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                                      OpStore %293 %302 
                                Private f32* %303 = OpAccessChain %207 %17 
                                         f32 %304 = OpLoad %303 
                                 Output f32* %306 = OpAccessChain %293 %17 
                                                      OpStore %306 %304 
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