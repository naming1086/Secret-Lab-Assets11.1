//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/Arcade" {
Properties {
}
SubShader {
 Pass {
  Name "Arcade"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 52269
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
uniform 	vec4 _Time;
uniform 	float _Fade;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(2.20000005, 2.20000005);
    u_xlat6.x = abs(u_xlat0.y) * 0.200000003;
    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
    u_xlat1.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = abs(u_xlat1.x) * 0.25;
    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
    u_xlat1.y = u_xlat0.x * u_xlat0.y;
    u_xlat0.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
    u_xlat0.xy = vec2(_Fade) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
    u_xlat6.xy = _Time.yy * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat9 = _Time.y * 0.330000013 + 0.300000012;
    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat6.x = u_xlat9 * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.00170000002 + u_xlat0.x;
    u_xlat1.x = u_xlat6.x + 0.00100000005;
    u_xlat1.y = u_xlat0.y + 0.00100000005;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.y;
    u_xlat6.x = u_xlat6.x * 16.0;
    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat2.x;
    u_xlat6.x = u_xlat2.y * u_xlat6.x;
    u_xlat6.x = log2(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 0.300000012;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.66000009, 2.66000009);
    u_xlat6.x = u_xlat0.y * _ScreenParams.y;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xw = _Time.yy * vec2(3.5, 110.0);
    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
    u_xlat0.xw = sin(u_xlat0.xw);
    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.70000005;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat2.xyz);
    SV_Target0.xyz = vec3(_Fade) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 365
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %350 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %99 0 Offset 99 
                                              OpMemberDecorate %99 1 Offset 99 
                                              OpMemberDecorate %99 2 Offset 99 
                                              OpDecorate %99 Block 
                                              OpDecorate %101 DescriptorSet 101 
                                              OpDecorate %101 Binding 101 
                                              OpDecorate %186 DescriptorSet 186 
                                              OpDecorate %186 Binding 186 
                                              OpDecorate %190 DescriptorSet 190 
                                              OpDecorate %190 Binding 190 
                                              OpDecorate %350 Location 350 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %14 = OpConstant 3.674022E-40 
                                f32_2 %15 = OpConstantComposite %14 %14 
                                  f32 %21 = OpConstant 3.674022E-40 
                                f32_2 %22 = OpConstantComposite %21 %21 
                                      %26 = OpTypePointer Private %10 
                       Private f32_2* %27 = OpVariable Private 
                                      %28 = OpTypeInt 32 0 
                                  u32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Private %6 
                                  f32 %34 = OpConstant 3.674022E-40 
                                  u32 %36 = OpConstant 0 
                                  f32 %43 = OpConstant 3.674022E-40 
                                      %46 = OpTypeVector %6 3 
                                      %47 = OpTypePointer Private %46 
                       Private f32_3* %48 = OpVariable Private 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %76 = OpConstant 3.674022E-40 
                                f32_2 %77 = OpConstantComposite %76 %76 
                                  f32 %84 = OpConstant 3.674022E-40 
                                f32_2 %85 = OpConstantComposite %84 %84 
                                  f32 %87 = OpConstant 3.674022E-40 
                                f32_2 %88 = OpConstantComposite %87 %87 
                                      %99 = OpTypeStruct %7 %7 %6 
                                     %100 = OpTypePointer Uniform %99 
Uniform struct {f32_4; f32_4; f32;}* %101 = OpVariable Uniform 
                                     %102 = OpTypeInt 32 1 
                                 i32 %103 = OpConstant 2 
                                     %104 = OpTypePointer Uniform %6 
                                 f32 %117 = OpConstant 3.674022E-40 
                                 f32 %125 = OpConstant 3.674022E-40 
                                 f32 %126 = OpConstant 3.674022E-40 
                               f32_2 %127 = OpConstantComposite %125 %126 
                                 i32 %129 = OpConstant 1 
                                     %130 = OpTypePointer Uniform %7 
                                 f32 %134 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                               f32_2 %136 = OpConstantComposite %134 %135 
                        Private f32* %148 = OpVariable Private 
                                 f32 %151 = OpConstant 3.674022E-40 
                                 f32 %156 = OpConstant 3.674022E-40 
                                 f32 %169 = OpConstant 3.674022E-40 
                                 f32 %177 = OpConstant 3.674022E-40 
                                     %184 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %185 = OpTypePointer UniformConstant %184 
UniformConstant read_only Texture2D* %186 = OpVariable UniformConstant 
                                     %188 = OpTypeSampler 
                                     %189 = OpTypePointer UniformConstant %188 
            UniformConstant sampler* %190 = OpVariable UniformConstant 
                                     %192 = OpTypeSampledImage %184 
                      Private f32_3* %198 = OpVariable Private 
                                 f32 %203 = OpConstant 3.674022E-40 
                               f32_3 %204 = OpConstantComposite %203 %203 %203 
                                 f32 %207 = OpConstant 3.674022E-40 
                               f32_3 %208 = OpConstantComposite %207 %207 %207 
                                 f32 %224 = OpConstant 3.674022E-40 
                               f32_2 %230 = OpConstantComposite %43 %43 
                                 f32 %263 = OpConstant 3.674022E-40 
                               f32_3 %264 = OpConstantComposite %263 %263 %263 
                                 i32 %268 = OpConstant 0 
                        Private f32* %282 = OpVariable Private 
                                 f32 %285 = OpConstant 3.674022E-40 
                                 f32 %289 = OpConstant 3.674022E-40 
                                 f32 %300 = OpConstant 3.674022E-40 
                                 f32 %310 = OpConstant 3.674022E-40 
                                 f32 %328 = OpConstant 3.674022E-40 
                                 f32 %337 = OpConstant 3.674022E-40 
                                     %349 = OpTypePointer Output %7 
                       Output f32_4* %350 = OpVariable Output 
                                 u32 %361 = OpConstant 3 
                                     %362 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %13 = OpLoad vs_TEXCOORD0 
                                f32_2 %16 = OpFAdd %13 %15 
                                f32_4 %17 = OpLoad %9 
                                f32_4 %18 = OpVectorShuffle %17 %16 4 5 2 3 
                                              OpStore %9 %18 
                                f32_4 %19 = OpLoad %9 
                                f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                                f32_2 %23 = OpFMul %20 %22 
                                f32_4 %24 = OpLoad %9 
                                f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
                                              OpStore %9 %25 
                         Private f32* %31 = OpAccessChain %9 %29 
                                  f32 %32 = OpLoad %31 
                                  f32 %33 = OpExtInst %1 4 %32 
                                  f32 %35 = OpFMul %33 %34 
                         Private f32* %37 = OpAccessChain %27 %36 
                                              OpStore %37 %35 
                         Private f32* %38 = OpAccessChain %27 %36 
                                  f32 %39 = OpLoad %38 
                         Private f32* %40 = OpAccessChain %27 %36 
                                  f32 %41 = OpLoad %40 
                                  f32 %42 = OpFMul %39 %41 
                                  f32 %44 = OpFAdd %42 %43 
                         Private f32* %45 = OpAccessChain %27 %36 
                                              OpStore %45 %44 
                         Private f32* %49 = OpAccessChain %27 %36 
                                  f32 %50 = OpLoad %49 
                         Private f32* %51 = OpAccessChain %9 %36 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFMul %50 %52 
                         Private f32* %54 = OpAccessChain %48 %36 
                                              OpStore %54 %53 
                         Private f32* %55 = OpAccessChain %48 %36 
                                  f32 %56 = OpLoad %55 
                                  f32 %57 = OpExtInst %1 4 %56 
                                  f32 %59 = OpFMul %57 %58 
                         Private f32* %60 = OpAccessChain %9 %36 
                                              OpStore %60 %59 
                         Private f32* %61 = OpAccessChain %9 %36 
                                  f32 %62 = OpLoad %61 
                         Private f32* %63 = OpAccessChain %9 %36 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFMul %62 %64 
                                  f32 %66 = OpFAdd %65 %43 
                         Private f32* %67 = OpAccessChain %9 %36 
                                              OpStore %67 %66 
                         Private f32* %68 = OpAccessChain %9 %36 
                                  f32 %69 = OpLoad %68 
                         Private f32* %70 = OpAccessChain %9 %29 
                                  f32 %71 = OpLoad %70 
                                  f32 %72 = OpFMul %69 %71 
                         Private f32* %73 = OpAccessChain %48 %29 
                                              OpStore %73 %72 
                                f32_3 %74 = OpLoad %48 
                                f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                f32_2 %78 = OpFMul %75 %77 
                                f32_2 %79 = OpFAdd %78 %77 
                                f32_4 %80 = OpLoad %9 
                                f32_4 %81 = OpVectorShuffle %80 %79 4 5 2 3 
                                              OpStore %9 %81 
                                f32_4 %82 = OpLoad %9 
                                f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                f32_2 %86 = OpFMul %83 %85 
                                f32_2 %89 = OpFAdd %86 %88 
                                f32_4 %90 = OpLoad %9 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                              OpStore %9 %91 
                                f32_4 %92 = OpLoad %9 
                                f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                f32_2 %94 = OpLoad vs_TEXCOORD0 
                                f32_2 %95 = OpFNegate %94 
                                f32_2 %96 = OpFAdd %93 %95 
                                f32_4 %97 = OpLoad %9 
                                f32_4 %98 = OpVectorShuffle %97 %96 4 5 2 3 
                                              OpStore %9 %98 
                        Uniform f32* %105 = OpAccessChain %101 %103 
                                 f32 %106 = OpLoad %105 
                               f32_2 %107 = OpCompositeConstruct %106 %106 
                               f32_4 %108 = OpLoad %9 
                               f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                               f32_2 %110 = OpFMul %107 %109 
                               f32_2 %111 = OpLoad vs_TEXCOORD0 
                               f32_2 %112 = OpFAdd %110 %111 
                               f32_4 %113 = OpLoad %9 
                               f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                              OpStore %9 %114 
                               f32_4 %115 = OpLoad %9 
                               f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                               f32_2 %118 = OpCompositeConstruct %117 %117 
                               f32_2 %119 = OpCompositeConstruct %43 %43 
                               f32_2 %120 = OpExtInst %1 43 %116 %118 %119 
                               f32_4 %121 = OpLoad %9 
                               f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                              OpStore %9 %122 
                               f32_4 %123 = OpLoad %9 
                               f32_2 %124 = OpVectorShuffle %123 %123 1 1 
                               f32_2 %128 = OpFMul %124 %127 
                                              OpStore %27 %128 
                      Uniform f32_4* %131 = OpAccessChain %101 %129 
                               f32_4 %132 = OpLoad %131 
                               f32_2 %133 = OpVectorShuffle %132 %132 1 1 
                               f32_2 %137 = OpFMul %133 %136 
                               f32_2 %138 = OpLoad %27 
                               f32_2 %139 = OpFAdd %137 %138 
                                              OpStore %27 %139 
                               f32_2 %140 = OpLoad %27 
                               f32_2 %141 = OpExtInst %1 13 %140 
                                              OpStore %27 %141 
                        Private f32* %142 = OpAccessChain %27 %29 
                                 f32 %143 = OpLoad %142 
                        Private f32* %144 = OpAccessChain %27 %36 
                                 f32 %145 = OpLoad %144 
                                 f32 %146 = OpFMul %143 %145 
                        Private f32* %147 = OpAccessChain %27 %36 
                                              OpStore %147 %146 
                        Uniform f32* %149 = OpAccessChain %101 %129 %29 
                                 f32 %150 = OpLoad %149 
                                 f32 %152 = OpFMul %150 %151 
                                 f32 %153 = OpFAdd %152 %134 
                                              OpStore %148 %153 
                        Private f32* %154 = OpAccessChain %9 %29 
                                 f32 %155 = OpLoad %154 
                                 f32 %157 = OpFMul %155 %156 
                                 f32 %158 = OpLoad %148 
                                 f32 %159 = OpFAdd %157 %158 
                                              OpStore %148 %159 
                                 f32 %160 = OpLoad %148 
                                 f32 %161 = OpExtInst %1 13 %160 
                                              OpStore %148 %161 
                                 f32 %162 = OpLoad %148 
                        Private f32* %163 = OpAccessChain %27 %36 
                                 f32 %164 = OpLoad %163 
                                 f32 %165 = OpFMul %162 %164 
                        Private f32* %166 = OpAccessChain %27 %36 
                                              OpStore %166 %165 
                        Private f32* %167 = OpAccessChain %27 %36 
                                 f32 %168 = OpLoad %167 
                                 f32 %170 = OpFMul %168 %169 
                        Private f32* %171 = OpAccessChain %9 %36 
                                 f32 %172 = OpLoad %171 
                                 f32 %173 = OpFAdd %170 %172 
                        Private f32* %174 = OpAccessChain %27 %36 
                                              OpStore %174 %173 
                        Private f32* %175 = OpAccessChain %27 %36 
                                 f32 %176 = OpLoad %175 
                                 f32 %178 = OpFAdd %176 %177 
                        Private f32* %179 = OpAccessChain %48 %36 
                                              OpStore %179 %178 
                        Private f32* %180 = OpAccessChain %9 %29 
                                 f32 %181 = OpLoad %180 
                                 f32 %182 = OpFAdd %181 %177 
                        Private f32* %183 = OpAccessChain %48 %29 
                                              OpStore %183 %182 
                 read_only Texture2D %187 = OpLoad %186 
                             sampler %191 = OpLoad %190 
          read_only Texture2DSampled %193 = OpSampledImage %187 %191 
                               f32_3 %194 = OpLoad %48 
                               f32_2 %195 = OpVectorShuffle %194 %194 0 1 
                               f32_4 %196 = OpImageSampleImplicitLod %193 %195 
                               f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                              OpStore %48 %197 
                               f32_3 %199 = OpLoad %48 
                               f32_3 %200 = OpLoad %48 
                               f32_3 %201 = OpFMul %199 %200 
                                              OpStore %198 %201 
                               f32_3 %202 = OpLoad %198 
                               f32_3 %205 = OpFMul %202 %204 
                                              OpStore %198 %205 
                               f32_3 %206 = OpLoad %48 
                               f32_3 %209 = OpFMul %206 %208 
                               f32_3 %210 = OpLoad %198 
                               f32_3 %211 = OpFAdd %209 %210 
                                              OpStore %48 %211 
                               f32_3 %212 = OpLoad %48 
                               f32_3 %213 = OpCompositeConstruct %117 %117 %117 
                               f32_3 %214 = OpCompositeConstruct %43 %43 %43 
                               f32_3 %215 = OpExtInst %1 43 %212 %213 %214 
                                              OpStore %48 %215 
                        Private f32* %216 = OpAccessChain %9 %36 
                                 f32 %217 = OpLoad %216 
                        Private f32* %218 = OpAccessChain %9 %29 
                                 f32 %219 = OpLoad %218 
                                 f32 %220 = OpFMul %217 %219 
                        Private f32* %221 = OpAccessChain %27 %36 
                                              OpStore %221 %220 
                        Private f32* %222 = OpAccessChain %27 %36 
                                 f32 %223 = OpLoad %222 
                                 f32 %225 = OpFMul %223 %224 
                        Private f32* %226 = OpAccessChain %27 %36 
                                              OpStore %226 %225 
                               f32_4 %227 = OpLoad %9 
                               f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                               f32_2 %229 = OpFNegate %228 
                               f32_2 %231 = OpFAdd %229 %230 
                               f32_3 %232 = OpLoad %198 
                               f32_3 %233 = OpVectorShuffle %232 %231 3 4 2 
                                              OpStore %198 %233 
                        Private f32* %234 = OpAccessChain %27 %36 
                                 f32 %235 = OpLoad %234 
                        Private f32* %236 = OpAccessChain %198 %36 
                                 f32 %237 = OpLoad %236 
                                 f32 %238 = OpFMul %235 %237 
                        Private f32* %239 = OpAccessChain %27 %36 
                                              OpStore %239 %238 
                        Private f32* %240 = OpAccessChain %198 %29 
                                 f32 %241 = OpLoad %240 
                        Private f32* %242 = OpAccessChain %27 %36 
                                 f32 %243 = OpLoad %242 
                                 f32 %244 = OpFMul %241 %243 
                        Private f32* %245 = OpAccessChain %27 %36 
                                              OpStore %245 %244 
                        Private f32* %246 = OpAccessChain %27 %36 
                                 f32 %247 = OpLoad %246 
                                 f32 %248 = OpExtInst %1 30 %247 
                        Private f32* %249 = OpAccessChain %27 %36 
                                              OpStore %249 %248 
                        Private f32* %250 = OpAccessChain %27 %36 
                                 f32 %251 = OpLoad %250 
                                 f32 %252 = OpFMul %251 %134 
                        Private f32* %253 = OpAccessChain %27 %36 
                                              OpStore %253 %252 
                        Private f32* %254 = OpAccessChain %27 %36 
                                 f32 %255 = OpLoad %254 
                                 f32 %256 = OpExtInst %1 29 %255 
                        Private f32* %257 = OpAccessChain %27 %36 
                                              OpStore %257 %256 
                               f32_2 %258 = OpLoad %27 
                               f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
                               f32_3 %260 = OpLoad %48 
                               f32_3 %261 = OpFMul %259 %260 
                                              OpStore %48 %261 
                               f32_3 %262 = OpLoad %48 
                               f32_3 %265 = OpFMul %262 %264 
                                              OpStore %48 %265 
                        Private f32* %266 = OpAccessChain %9 %29 
                                 f32 %267 = OpLoad %266 
                        Uniform f32* %269 = OpAccessChain %101 %268 %29 
                                 f32 %270 = OpLoad %269 
                                 f32 %271 = OpFMul %267 %270 
                        Private f32* %272 = OpAccessChain %27 %36 
                                              OpStore %272 %271 
                 read_only Texture2D %273 = OpLoad %186 
                             sampler %274 = OpLoad %190 
          read_only Texture2DSampled %275 = OpSampledImage %273 %274 
                               f32_4 %276 = OpLoad %9 
                               f32_2 %277 = OpVectorShuffle %276 %276 0 1 
                               f32_4 %278 = OpImageSampleImplicitLod %275 %277 
                               f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                               f32_4 %280 = OpLoad %9 
                               f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 6 
                                              OpStore %9 %281 
                        Uniform f32* %283 = OpAccessChain %101 %129 %29 
                                 f32 %284 = OpLoad %283 
                                 f32 %286 = OpFMul %284 %285 
                                              OpStore %282 %286 
                        Private f32* %287 = OpAccessChain %27 %36 
                                 f32 %288 = OpLoad %287 
                                 f32 %290 = OpFMul %288 %289 
                                 f32 %291 = OpLoad %282 
                                 f32 %292 = OpFAdd %290 %291 
                        Private f32* %293 = OpAccessChain %27 %36 
                                              OpStore %293 %292 
                        Private f32* %294 = OpAccessChain %27 %36 
                                 f32 %295 = OpLoad %294 
                                 f32 %296 = OpExtInst %1 13 %295 
                        Private f32* %297 = OpAccessChain %27 %36 
                                              OpStore %297 %296 
                        Private f32* %298 = OpAccessChain %27 %36 
                                 f32 %299 = OpLoad %298 
                                 f32 %301 = OpFMul %299 %300 
                                 f32 %302 = OpFAdd %301 %300 
                        Private f32* %303 = OpAccessChain %27 %36 
                                              OpStore %303 %302 
                        Private f32* %304 = OpAccessChain %27 %36 
                                 f32 %305 = OpLoad %304 
                                 f32 %306 = OpExtInst %1 30 %305 
                        Private f32* %307 = OpAccessChain %27 %36 
                                              OpStore %307 %306 
                        Private f32* %308 = OpAccessChain %27 %36 
                                 f32 %309 = OpLoad %308 
                                 f32 %311 = OpFMul %309 %310 
                        Private f32* %312 = OpAccessChain %27 %36 
                                              OpStore %312 %311 
                        Private f32* %313 = OpAccessChain %27 %36 
                                 f32 %314 = OpLoad %313 
                                 f32 %315 = OpExtInst %1 29 %314 
                        Private f32* %316 = OpAccessChain %27 %36 
                                              OpStore %316 %315 
                        Private f32* %317 = OpAccessChain %27 %36 
                                 f32 %318 = OpLoad %317 
                                 f32 %319 = OpFMul %318 %135 
                                 f32 %320 = OpFAdd %319 %203 
                        Private f32* %321 = OpAccessChain %27 %36 
                                              OpStore %321 %320 
                               f32_2 %322 = OpLoad %27 
                               f32_3 %323 = OpVectorShuffle %322 %322 0 0 0 
                               f32_3 %324 = OpLoad %48 
                               f32_3 %325 = OpFMul %323 %324 
                                              OpStore %48 %325 
                        Uniform f32* %326 = OpAccessChain %101 %129 %29 
                                 f32 %327 = OpLoad %326 
                                 f32 %329 = OpFMul %327 %328 
                        Private f32* %330 = OpAccessChain %27 %36 
                                              OpStore %330 %329 
                        Private f32* %331 = OpAccessChain %27 %36 
                                 f32 %332 = OpLoad %331 
                                 f32 %333 = OpExtInst %1 13 %332 
                        Private f32* %334 = OpAccessChain %27 %36 
                                              OpStore %334 %333 
                        Private f32* %335 = OpAccessChain %27 %36 
                                 f32 %336 = OpLoad %335 
                                 f32 %338 = OpFMul %336 %337 
                                 f32 %339 = OpFAdd %338 %43 
                        Private f32* %340 = OpAccessChain %27 %36 
                                              OpStore %340 %339 
                               f32_3 %341 = OpLoad %48 
                               f32_2 %342 = OpLoad %27 
                               f32_3 %343 = OpVectorShuffle %342 %342 0 0 0 
                               f32_3 %344 = OpFMul %341 %343 
                               f32_4 %345 = OpLoad %9 
                               f32_3 %346 = OpVectorShuffle %345 %345 0 1 3 
                               f32_3 %347 = OpFNegate %346 
                               f32_3 %348 = OpFAdd %344 %347 
                                              OpStore %48 %348 
                        Uniform f32* %351 = OpAccessChain %101 %103 
                                 f32 %352 = OpLoad %351 
                               f32_3 %353 = OpCompositeConstruct %352 %352 %352 
                               f32_3 %354 = OpLoad %48 
                               f32_3 %355 = OpFMul %353 %354 
                               f32_4 %356 = OpLoad %9 
                               f32_3 %357 = OpVectorShuffle %356 %356 0 1 3 
                               f32_3 %358 = OpFAdd %355 %357 
                               f32_4 %359 = OpLoad %350 
                               f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                              OpStore %350 %360 
                         Output f32* %363 = OpAccessChain %350 %361 
                                              OpStore %363 %43 
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