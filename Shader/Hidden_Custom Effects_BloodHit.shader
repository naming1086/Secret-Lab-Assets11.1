//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/BloodHit" {
Properties {
}
SubShader {
 Pass {
  Name "BloodHit"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 25677
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
uniform 	float _LightReflect;
uniform 	float _HitLeft;
uniform 	float _HitUp;
uniform 	float _HitRight;
uniform 	float _HitDown;
uniform 	float _BloodHitLeft;
uniform 	float _BloodHitUp;
uniform 	float _BloodHitRight;
uniform 	float _BloodHitDown;
uniform 	float _HitFull;
uniform 	float _BloodHitFull1;
uniform 	float _BloodHitFull2;
uniform 	float _BloodHitFull3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.0, 0.5, 0.5, 0.5);
    u_xlat1 = texture(_MainTex2, u_xlat0.zw);
    u_xlat0 = texture(_MainTex2, u_xlat0.xy);
    u_xlat12 = u_xlat1.x * _HitUp;
    u_xlat0.x = u_xlat0.x * _HitLeft + u_xlat12;
    u_xlat1.xw = vs_TEXCOORD0.xy * vec2(0.5, 0.5);
    u_xlat2 = texture(_MainTex2, u_xlat1.xw);
    u_xlat0.x = u_xlat2.x * _HitRight + u_xlat0.x;
    u_xlat1.xw = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.0);
    u_xlat3 = texture(_MainTex2, u_xlat1.xw);
    u_xlat0.x = u_xlat3.x * _HitDown + u_xlat0.x;
    u_xlat0.x = u_xlat0.y * _BloodHitLeft + u_xlat0.x;
    u_xlat0.x = u_xlat1.y * _BloodHitUp + u_xlat0.x;
    u_xlat0.x = u_xlat2.y * _BloodHitRight + u_xlat0.x;
    u_xlat0.x = u_xlat3.y * _BloodHitDown + u_xlat0.x;
    u_xlat0.x = u_xlat0.z * _HitFull + u_xlat0.x;
    u_xlat0.x = u_xlat1.z * _BloodHitFull1 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z * _BloodHitFull2 + u_xlat0.x;
    u_xlat0.x = u_xlat3.z * _BloodHitFull3 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightReflect;
    u_xlat1.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.yz = u_xlat1.yz;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat0.xyz;
    SV_Target0.x = u_xlat1.x + u_xlat0.x;
    SV_Target0.yz = u_xlat0.yz;
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
; Bound: 260
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %244 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpMemberDecorate %54 10 Offset 54 
                                                      OpMemberDecorate %54 11 Offset 54 
                                                      OpMemberDecorate %54 12 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %220 DescriptorSet 220 
                                                      OpDecorate %220 Binding 220 
                                                      OpDecorate %244 Location 244 
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
                                        f32_4 %16 = OpConstantComposite %15 %15 %15 %15 
                                          f32 %18 = OpConstant 3.674022E-40 
                                        f32_4 %19 = OpConstantComposite %18 %15 %15 %15 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %23 = OpTypePointer UniformConstant %22 
         UniformConstant read_only Texture2D* %24 = OpVariable UniformConstant 
                                              %26 = OpTypeSampler 
                                              %27 = OpTypePointer UniformConstant %26 
                     UniformConstant sampler* %28 = OpVariable UniformConstant 
                                              %30 = OpTypeSampledImage %22 
                                              %35 = OpTypeVector %6 3 
                                              %48 = OpTypePointer Private %6 
                                 Private f32* %49 = OpVariable Private 
                                              %50 = OpTypeInt 32 0 
                                          u32 %51 = OpConstant 0 
                                              %54 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %56 = OpVariable Uniform 
                                              %57 = OpTypeInt 32 1 
                                          i32 %58 = OpConstant 2 
                                              %59 = OpTypePointer Uniform %6 
                                          i32 %65 = OpConstant 1 
                                        f32_2 %73 = OpConstantComposite %15 %15 
                                              %77 = OpTypePointer Private %35 
                               Private f32_3* %78 = OpVariable Private 
                                          i32 %88 = OpConstant 3 
                                        f32_2 %98 = OpConstantComposite %15 %18 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %112 = OpConstant 4 
                                         u32 %120 = OpConstant 1 
                                         i32 %123 = OpConstant 5 
                                         i32 %133 = OpConstant 6 
                                         i32 %143 = OpConstant 7 
                                         i32 %153 = OpConstant 8 
                                         u32 %161 = OpConstant 2 
                                         i32 %164 = OpConstant 9 
                                         i32 %174 = OpConstant 10 
                                         i32 %184 = OpConstant 11 
                                         i32 %194 = OpConstant 12 
                                         i32 %204 = OpConstant 0 
                                         f32 %211 = OpConstant 3.674022E-40 
                                       f32_2 %212 = OpConstantComposite %211 %211 
        UniformConstant read_only Texture2D* %218 = OpVariable UniformConstant 
                    UniformConstant sampler* %220 = OpVariable UniformConstant 
                                         f32 %235 = OpConstant 3.674022E-40 
                                       f32_3 %236 = OpConstantComposite %235 %235 %235 
                                             %243 = OpTypePointer Output %7 
                               Output f32_4* %244 = OpVariable Output 
                                             %250 = OpTypePointer Output %6 
                                         f32 %256 = OpConstant 3.674022E-40 
                                         u32 %257 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                                        f32_4 %17 = OpFMul %14 %16 
                                        f32_4 %20 = OpFAdd %17 %19 
                                                      OpStore %9 %20 
                          read_only Texture2D %25 = OpLoad %24 
                                      sampler %29 = OpLoad %28 
                   read_only Texture2DSampled %31 = OpSampledImage %25 %29 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 2 3 
                                        f32_4 %34 = OpImageSampleImplicitLod %31 %33 
                                        f32_3 %36 = OpVectorShuffle %34 %34 0 1 2 
                                        f32_4 %37 = OpLoad %21 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                      OpStore %21 %38 
                          read_only Texture2D %39 = OpLoad %24 
                                      sampler %40 = OpLoad %28 
                   read_only Texture2DSampled %41 = OpSampledImage %39 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                        f32_4 %44 = OpImageSampleImplicitLod %41 %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                                      OpStore %9 %47 
                                 Private f32* %52 = OpAccessChain %21 %51 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %60 = OpAccessChain %56 %58 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFMul %53 %61 
                                                      OpStore %49 %62 
                                 Private f32* %63 = OpAccessChain %9 %51 
                                          f32 %64 = OpLoad %63 
                                 Uniform f32* %66 = OpAccessChain %56 %65 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %64 %67 
                                          f32 %69 = OpLoad %49 
                                          f32 %70 = OpFAdd %68 %69 
                                 Private f32* %71 = OpAccessChain %9 %51 
                                                      OpStore %71 %70 
                                        f32_2 %72 = OpLoad vs_TEXCOORD0 
                                        f32_2 %74 = OpFMul %72 %73 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 1 2 5 
                                                      OpStore %21 %76 
                          read_only Texture2D %79 = OpLoad %24 
                                      sampler %80 = OpLoad %28 
                   read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                                        f32_4 %82 = OpLoad %21 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 3 
                                        f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %78 %85 
                                 Private f32* %86 = OpAccessChain %78 %51 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %89 = OpAccessChain %56 %88 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %87 %90 
                                 Private f32* %92 = OpAccessChain %9 %51 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFAdd %91 %93 
                                 Private f32* %95 = OpAccessChain %9 %51 
                                                      OpStore %95 %94 
                                        f32_2 %96 = OpLoad vs_TEXCOORD0 
                                        f32_2 %97 = OpFMul %96 %73 
                                        f32_2 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %21 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 2 5 
                                                      OpStore %21 %101 
                         read_only Texture2D %103 = OpLoad %24 
                                     sampler %104 = OpLoad %28 
                  read_only Texture2DSampled %105 = OpSampledImage %103 %104 
                                       f32_4 %106 = OpLoad %21 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 3 
                                       f32_4 %108 = OpImageSampleImplicitLod %105 %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                                      OpStore %102 %109 
                                Private f32* %110 = OpAccessChain %102 %51 
                                         f32 %111 = OpLoad %110 
                                Uniform f32* %113 = OpAccessChain %56 %112 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %111 %114 
                                Private f32* %116 = OpAccessChain %9 %51 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %9 %51 
                                                      OpStore %119 %118 
                                Private f32* %121 = OpAccessChain %9 %120 
                                         f32 %122 = OpLoad %121 
                                Uniform f32* %124 = OpAccessChain %56 %123 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFMul %122 %125 
                                Private f32* %127 = OpAccessChain %9 %51 
                                         f32 %128 = OpLoad %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %130 = OpAccessChain %9 %51 
                                                      OpStore %130 %129 
                                Private f32* %131 = OpAccessChain %21 %120 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %56 %133 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFMul %132 %135 
                                Private f32* %137 = OpAccessChain %9 %51 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFAdd %136 %138 
                                Private f32* %140 = OpAccessChain %9 %51 
                                                      OpStore %140 %139 
                                Private f32* %141 = OpAccessChain %78 %120 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %144 = OpAccessChain %56 %143 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpFMul %142 %145 
                                Private f32* %147 = OpAccessChain %9 %51 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFAdd %146 %148 
                                Private f32* %150 = OpAccessChain %9 %51 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %102 %120 
                                         f32 %152 = OpLoad %151 
                                Uniform f32* %154 = OpAccessChain %56 %153 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %152 %155 
                                Private f32* %157 = OpAccessChain %9 %51 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %9 %51 
                                                      OpStore %160 %159 
                                Private f32* %162 = OpAccessChain %9 %161 
                                         f32 %163 = OpLoad %162 
                                Uniform f32* %165 = OpAccessChain %56 %164 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %163 %166 
                                Private f32* %168 = OpAccessChain %9 %51 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFAdd %167 %169 
                                Private f32* %171 = OpAccessChain %9 %51 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %21 %161 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %175 = OpAccessChain %56 %174 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFMul %173 %176 
                                Private f32* %178 = OpAccessChain %9 %51 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFAdd %177 %179 
                                Private f32* %181 = OpAccessChain %9 %51 
                                                      OpStore %181 %180 
                                Private f32* %182 = OpAccessChain %78 %161 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %185 = OpAccessChain %56 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFMul %183 %186 
                                Private f32* %188 = OpAccessChain %9 %51 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFAdd %187 %189 
                                Private f32* %191 = OpAccessChain %9 %51 
                                                      OpStore %191 %190 
                                Private f32* %192 = OpAccessChain %102 %161 
                                         f32 %193 = OpLoad %192 
                                Uniform f32* %195 = OpAccessChain %56 %194 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %193 %196 
                                Private f32* %198 = OpAccessChain %9 %51 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFAdd %197 %199 
                                Private f32* %201 = OpAccessChain %9 %51 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %9 %51 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %205 = OpAccessChain %56 %204 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFMul %203 %206 
                                Private f32* %208 = OpAccessChain %9 %51 
                                                      OpStore %208 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
                                       f32_2 %213 = OpFMul %210 %212 
                                       f32_2 %214 = OpLoad vs_TEXCOORD0 
                                       f32_2 %215 = OpFAdd %213 %214 
                                       f32_4 %216 = OpLoad %21 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 2 3 
                                                      OpStore %21 %217 
                         read_only Texture2D %219 = OpLoad %218 
                                     sampler %221 = OpLoad %220 
                  read_only Texture2DSampled %222 = OpSampledImage %219 %221 
                                       f32_4 %223 = OpLoad %21 
                                       f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                       f32_4 %225 = OpImageSampleImplicitLod %222 %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_4 %227 = OpLoad %21 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %21 %228 
                                       f32_4 %229 = OpLoad %21 
                                       f32_2 %230 = OpVectorShuffle %229 %229 1 2 
                                       f32_4 %231 = OpLoad %9 
                                       f32_4 %232 = OpVectorShuffle %231 %230 0 4 5 3 
                                                      OpStore %9 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %237 = OpFMul %234 %236 
                                       f32_4 %238 = OpLoad %9 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFAdd %237 %239 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
                                                      OpStore %9 %242 
                                Private f32* %245 = OpAccessChain %21 %51 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %9 %51 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFAdd %246 %248 
                                 Output f32* %251 = OpAccessChain %244 %51 
                                                      OpStore %251 %249 
                                       f32_4 %252 = OpLoad %9 
                                       f32_2 %253 = OpVectorShuffle %252 %252 1 2 
                                       f32_4 %254 = OpLoad %244 
                                       f32_4 %255 = OpVectorShuffle %254 %253 0 4 5 3 
                                                      OpStore %244 %255 
                                 Output f32* %258 = OpAccessChain %244 %257 
                                                      OpStore %258 %256 
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